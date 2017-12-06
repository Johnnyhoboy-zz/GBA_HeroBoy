#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "slash.h"
#include "fireball.h"
#include "collisionmap.h"
#include "collisionmap2.h"
#include "pig.h"
#include "hurt.h"
#include "slimehit.h"
#include "slimedeath.h"

// Variables
BULLET bullets[BULLETCOUNT];
BULLET enemyBullets[ENEMYBULLETCOUNT];
BULLET bossBullets[ENEMYBULLETCOUNT];
BULLET cheatBullets[10];

ANISPRITE enemies[ENEMYCOUNT];
ANISPRITE king;
LIFE hearts[LIFECOUNT];

int enemiesRemaining;
int lives;

// Background offsets
int hOff = 0;
int vOff = 0;

//Enemy variables
int count = 0;
int forward = 1;

ANISPRITE player;
ANISPRITE enemy1;

enum {PLAYERFRONT, PLAYERBACK,  PLAYERLEFT, PLAYERRIGHT, PLAYERIDLE};
enum {ENEMYFRONT, ENEMYFIRE, ENEMYDIE, ENEMYIDLE};


// Initialize the game
void initGame() {

	initPlayer();
	initBullets();
	initEnemies();
	initLives();

    // Initialize the score
	enemiesRemaining = ENEMYCOUNT;

	// Intialize lives and score
	lives = 3;
	king.hide = 1;
	isBoss = 0;

	// Initialize background offsets
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
}


// Updates the game each frame
void updateGame() {

	updatePlayer();
	updateLives();


	// Update all the bullets
	if(cheat) {

		for (int i = 0; i < 10; i++) {
			updateBullet(&cheatBullets[i]);
		}

	} else {

		for (int i = 0; i < BULLETCOUNT; i++) {
			updateBullet(&bullets[i]);
		}
	}

	if(!isBoss) {
		// Update all the enemy bullets
		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
			updateBullet(&enemyBullets[i]);
		}
		//Update all enemies
		for (int i = 0; i < ENEMYCOUNT; i++) {
			updateEnemies(&enemies[i]);
			
		}
	} else {

		updateEnemies(&king);

		//update all enemy boss bullets
		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
			updateBullet(&bossBullets[i]);
			
		}
	}



}

// Draws the game each frame
void drawGame() {

	drawPlayer();

	// Draw all the hearts
	for (int i = 0; i < LIFECOUNT; i++){
		drawLives(&hearts[i]);
	}


	if(cheat) {

		for (int i = 0; i < 10; i++){

			drawBullet(&cheatBullets[i]);
		}	

	} else {

		for (int i = 0; i < BULLETCOUNT; i++){

			drawBullet(&bullets[i]);
		}
	}


	if(!isBoss) {
		for (int i = 0; i < ENEMYBULLETCOUNT; i++){
			drawEnemyBullet(&enemyBullets[i]);
		}

		//Draw all enemies
		for (int i = 0; i < ENEMYCOUNT; i++) {
			drawEnemies(&enemies[i]);
		}
	} else {

		drawBoss();
		//Draw all enemies
		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
			drawBossBullet(&bossBullets[i]);
		}
	}
	DMANow(3, shadowOAM, OAM, 128*4);

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}


//Starts the boss level
void initBossGame() {
	

	// Initialize the score
	enemiesRemaining = 1;
	isBoss = 1;
	hOff = 0;
	vOff = 0;

	initPlayer();
	initBoss();
	initBullets();

}

void initBoss() {

	king.width = 50;
    king.height = 50;
    king.rdel = 1;
    king.cdel = 1;
    king.worldRow = 250;
    king.worldCol = 200;
    king.aniCounter = 0;
    king.curFrame = 0;
    king.numFrames = 2;
    king.active = 1;
    king.index = 40;
    king.aniState = 0;
    king.hide = 0;
    king.hits = 10;
}



// Initialize the player
void initPlayer() {

    player.width = 24;
    player.height = 24;
    player.rdel = 1;
    player.cdel = 1;
    player.worldRow = 160/2-player.width/2 + vOff;  // Puts it in the middle of the screen in the world
    player.worldCol = 240/2-player.height/2 + hOff; // Puts it in the middle of the screen in the world
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 2;
    player.active = 1;
    player.index = 0;
    player.aniState = PLAYERFRONT;
    player.dieCounter = 0;
}

void initLives() {

	for(int i = 0; i < LIFECOUNT; i++) {
		hearts[i].screenRow = 4;
		hearts[i].screenCol = 4 + i*20;
		hearts[i].hide = 0;
		hearts[i].index = 27 + i;
	}

}

// Initialize the player
void initEnemies() {

	for (int i = 0; i < ENEMYCOUNT; i++) {

		enemies[i].width = 24; 
		enemies[i].height = 24; 
		if(i == 0) {   
    		enemies[i].worldRow = 64; 
    		enemies[i].worldCol = 415; 
    	} else if (i == 1) {
    		enemies[i].worldRow = 310; 
    		enemies[i].worldCol = 190; 
    	} else if (i == 2) {
    		enemies[i].worldRow = 440; 
    		enemies[i].worldCol = 130; 
    	} else if (i == 3) {
    		enemies[i].worldRow = 432; 
    		enemies[i].worldCol = 415; 
    	} else if (i == 4) {
    		enemies[i].worldRow = 280; 
    		enemies[i].worldCol = 415; 
    	}
    	enemies[i].rdel = 1;
    	enemies[i].cdel = 1;
	    enemies[i].aniCounter = 0;
	    enemies[i].curFrame = 0;
	    enemies[i].numFrames = 2;
	    enemies[i].active = 1;
	    enemies[i].index = 1*i + 11; 		// Index in shadowOAM; player is 0, then 10 bullets
	    enemies[i].aniState = ENEMYFRONT;
	    enemies[i].dieCounter = 0;
	}
}

// Initialize the pool of bullets
void initBullets() {

	if(cheat) {

		for (int i = 0; i < 10; i++) {

			cheatBullets[i].height = 24; 
			cheatBullets[i].width = 24;    
	    	cheatBullets[i].screenRow = 0;
	    	cheatBullets[i].screenCol = 0;
	    	cheatBullets[i].worldRow = 0; 
	    	cheatBullets[i].worldCol = 0; 
			cheatBullets[i].rdel = 2;
	        cheatBullets[i].cdel = 2;
			cheatBullets[i].active = 0;
			cheatBullets[i].index = i*1 + 30; 
			cheatBullets[i].direction = 0;
			cheatBullets[i].range = 0;
			cheatBullets[i].hide = 1;
			cheatBullets[i].type = 0;
		}

	} else {

		//Player Bullets
		for (int i = 0; i < BULLETCOUNT; i++) {

			bullets[i].height = 24; 
			bullets[i].width = 24;    
	    	bullets[i].screenRow = 0;
	    	bullets[i].screenCol = 0;
	    	bullets[i].worldRow = 0; 
	    	bullets[i].worldCol = 0; 
			bullets[i].rdel = 2;
	        bullets[i].cdel = 2;
			bullets[i].active = 0;
			bullets[i].index = i+1; // Index in shadowOAM; player is 0
			bullets[i].direction = 0;
			bullets[i].range = 0;
			bullets[i].hide = 1;
			bullets[i].type = 0;
		}
	}


	if(!isBoss) {
	//Enemy Bullets
		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {

			enemyBullets[i].height = 24; 
			enemyBullets[i].width = 24;    
	    	enemyBullets[i].screenRow = 0;
	    	enemyBullets[i].screenCol = 0;
	    	enemyBullets[i].worldRow = 0; 
	    	enemyBullets[i].worldCol = 0; 
			enemyBullets[i].rdel = 2;
	        enemyBullets[i].cdel = 2;
			enemyBullets[i].active = 0;
			enemyBullets[i].index = i*1 + 20; //Player, playerbullets up to 10, 5 enemies
			enemyBullets[i].direction = 0;
			enemyBullets[i].range = 0;
			enemyBullets[i].hide = 1;
			enemyBullets[i].type = 1; //Enemy Bullets
		}
	} else {

		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {

			bossBullets[i].height = 50; 
			bossBullets[i].width = 50;    
	    	bossBullets[i].screenRow = 0;
	    	bossBullets[i].screenCol = 0;
	    	bossBullets[i].worldRow = 0; 
	    	bossBullets[i].worldCol = 0; 
			bossBullets[i].rdel = 2;
	        bossBullets[i].cdel = 2;
			bossBullets[i].active = 0;
			bossBullets[i].index = i*1 + 45; 
			bossBullets[i].direction = 0;
			bossBullets[i].range = 0;
			bossBullets[i].hide = 1;
			bossBullets[i].type = 2; //Boss Bullets
			if(i == 0 || i == 2 || i == 4){
				bossBullets[i].direction = 0;
			}
			else{
				bossBullets[i].direction = 1;
			}
		}



	}


}

void updateLives() {

	if(lives == 2) {
		hearts[2].hide = 1;
	}

	if(lives == 1) {
		hearts[1].hide = 1;
	}

}

// Handle every-frame actions of the player
void updatePlayer() {

        player.prevAniState = player.aniState;
        player.aniState = PLAYERIDLE;


        //Calculate player screenrow and screencol
    	player.screenCol = player.worldCol - hOff;
		player.screenRow = player.worldRow - vOff;


	// Move the player
      // Change the animation frame every 20 frames of gameplay
        if(player.aniCounter % 20 == 0) {
            if (player.curFrame < 1) {
                player.curFrame++;
            }
            else {
                player.curFrame = 0;
            }

        }
        

	        // Control movement and change animation state
	        if(BUTTON_HELD(BUTTON_UP)) {

	        	player.aniState = PLAYERBACK;

	        	if( player.screenRow >= 0 && collisionmapBitmap[OFFSET(player.worldRow - 1, player.worldCol, MAPWIDTH)]
				&& collisionmapBitmap[OFFSET(player.worldRow  - 1, player.worldCol + player.width - 1, MAPWIDTH)]) {
	            
			        if(player.worldRow - 80 + 16 <= 0) {
						player.worldRow--;
					} else if (player.worldRow + 80 + 16 > 512 ) {
						player.worldRow--;
					} else {
						vOff--;
						player.worldRow--;
				    }
				}
	        }
	        if(BUTTON_HELD(BUTTON_DOWN)){
	        	player.aniState = PLAYERFRONT;
	        	if( player.screenRow + player.height < 160 && collisionmapBitmap[OFFSET(player.worldRow + player.height , player.worldCol, MAPWIDTH)]
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height, player.worldCol + player.width - 1, MAPWIDTH)]) {
	            
					if(player.worldRow - 80 + 16 <= 0) {
						player.worldRow++;
					} else if (player.worldRow + 80 + 16 > 512 ) {
						player.worldRow++;
					} else {
						vOff++;
						player.worldRow++;
				    }
				}
	        }
	        if(BUTTON_HELD(BUTTON_LEFT)) {
 				player.aniState = PLAYERLEFT;
	        	if( player.screenCol >= 0 && collisionmapBitmap[OFFSET(player.worldRow , player.worldCol  - 1, MAPWIDTH)]
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol - 1, MAPWIDTH)]) {
	           
					if(player.worldCol - 120 + 16 < 0){
						player.worldCol--;
					}
					else if (player.worldCol + 120 + 16 >= 512){
						player.worldCol--;
					}
					else {
						hOff--;
						player.worldCol--;
					}
				}
	        }
	        if(BUTTON_HELD(BUTTON_RIGHT)) {
	        	player.aniState = PLAYERRIGHT;
	        	if( player.screenCol + player.width < 240 && collisionmapBitmap[OFFSET(player.worldRow , player.worldCol + player.width, MAPWIDTH)]
				&& collisionmapBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width, MAPWIDTH)]) {
	           
					if(player.worldCol - 120 + 16 < 0){
						player.worldCol++;
					}
					else if (player.worldCol + 120 + 16 >= 512){
						player.worldCol++;
					}
					else {
						hOff++;
						player.worldCol++;
					} 
				}    
			}



        if (player.aniState == PLAYERIDLE) {
            player.curFrame = 0;
            player.aniState = player.prevAniState;
        }
        else {
            player.aniCounter++;
        }



	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A)) {

		fireBullet();
	}

}




void updateEnemies(ANISPRITE * e) {

	//Add some time for death frame
	if(e->aniState == ENEMYDIE ) {
		e->dieCounter++;
		if(e->dieCounter == 30) {
			e->active = 0;
			enemiesRemaining--;
		}
	}

	if(e->active && e->aniState != ENEMYDIE) {
		
	    e->hide = (e->screenRow < -e->height || e->screenRow > 160) ? 1 : 0;


        e->prevAniState = e->aniState;
        e->aniState = ENEMYIDLE;

      // Change the animation frame every 20 frames of gameplay
        if(e->aniCounter % 50 == 0 && e->aniState != ENEMYDIE) {
            if (e->curFrame < 1) {
                e->curFrame++;
                fireEnemyBullet();
            }
            else {
                e->curFrame = 0;
            }

        }

		//Player bullet to enemy collisions
        if(cheat) {
	        
		    for(int i = 0; i < 10; i++) {
		    	if(collision(e->worldRow, e->worldCol, e->height, e->width, 
		    		cheatBullets[i].worldRow, cheatBullets[i].worldCol, cheatBullets[i].height, cheatBullets[i].width) && cheatBullets[i].active) {
			    		e->aniState = ENEMYDIE;
			    		e->curFrame = ENEMYDIE;
			    		cheatBullets[i].active = 0;
			    		if(!isBoss) {	
			    			playSoundB(pig, PIGLEN, PIGFREQ, 0);
					    	
				    	} else if (!e->hide){
				    		e->hits--;
				    		playSoundB(slimehit, SLIMEHITLEN, SLIMEHITFREQ, 0);
				    		if(e->hits == 0){
				    			playSoundB(slimedeath, SLIMEDEATHLEN, SLIMEDEATHFREQ, 0);
				    			e->active = 0;
				    		} else {
				    			e->aniState = ENEMYFRONT;
				    		}

				    	}	
		    		

		    	}

		    }

        } else {

		    for(int i = 0; i < BULLETCOUNT; i++) {
		    	if(collision(e->worldRow, e->worldCol, e->height, e->width, 
		    		bullets[i].worldRow, bullets[i].worldCol, bullets[i].height, bullets[i].width) && bullets[i].active) {
		    			e->aniState = ENEMYDIE;
			    		e->curFrame = ENEMYDIE;
			    		bullets[i].active = 0;
			    		if(!isBoss) {
				    		playSoundB(pig, PIGLEN, PIGFREQ, 0);
					    
				    	} else if (!e->hide){
				    		e->hits--;
				    		playSoundB(slimehit, SLIMEHITLEN, SLIMEHITFREQ, 0);
				    		if(e->hits == 0){
				    			playSoundB(slimedeath, SLIMEDEATHLEN, SLIMEDEATHFREQ, 0);
				    			e->active = 0;
				    		
				    		} else {
				    			e->aniState = ENEMYFRONT;
				    		}

				    	}	
		    		

		    	}

		    }
		}


	    //Player-enemy collision
		if (collision(e->worldRow, e->worldCol, e->height, e->width,
			player.worldRow, player.worldCol, player.height, player.width)) {
			lives--;
			e->active = 0;
			playSoundB(hurt, HURTLEN, HURTFREQ, 0);
			if(isBoss) {
				lives = 0;
			}
			if(lives == 0) {
				goToLose();
			}
			enemiesRemaining--;
		}

		//Move enemy forward and backward
		if(!isBoss) {
			if (count <= 144 && forward && e->aniState != ENEMYDIE) {
				e->aniState = ENEMYFIRE;
				e->worldCol--;
				count++;
				if(count == 144){
					count = 0;
					forward = 0;
				}
			} else if (count <= 144 && !forward && e->aniState != ENEMYDIE){
				e->aniState = ENEMYFIRE;
				e->worldCol++;
				count++;
				if(count == 144){
					count = 0;
					forward = 1;
				}
			}
		} else {

			if (count <= 120 && forward && e->aniState != ENEMYDIE) {
				e->aniState = ENEMYFIRE;
				e->worldRow--;
				count++;
				if(count == 120){
					count = 0;
					forward = 0;
				}
			} else if (count <= 120 && !forward && e->aniState != ENEMYDIE){
				e->aniState = ENEMYFIRE;
				e->worldRow++;
				count++;
				if(count == 120){
					count = 0;
					forward = 1;
				}
			}


		}


        if (e->aniState == ENEMYIDLE) {
            e->curFrame = 0;
            e->aniState = e->prevAniState;
        }
        else {
            e->aniCounter++;
        }

	}

	    e->screenCol = e->worldCol - hOff;
	    e->screenRow = e->worldRow - vOff;


}




// Handle every-frame actions of a bullet
void updateBullet(BULLET* b) {


	// If active, update; otherwise ignore
	if (b->active) {
			
			//Range of bullets
			if(!cheat && b->range == 50) {
				b->active = 0;
				b->range = 0;
				b->hide = 1;
			} else if (cheat && b->range == 75) {
				b->active = 0;
				b->range = 0;
				b->hide = 1;	
			}

			//Handle enemy bullets
			if (b->type == 1){

            	b->worldCol -= b->cdel;
            	b->range++;

				//Player bullet and enemy bullet collision
	            if (cheat) {
				    for(int i = 0; i < 10; i++) {
						if(collision(b->worldRow, b->worldCol, b->height, b->width, 
						    		cheatBullets[i].worldRow, cheatBullets[i].worldCol, cheatBullets[i].height, cheatBullets[i].width) 
							&& cheatBullets[i].active) {

							b->active = 0;
							b->hide = 0;
							b->range = 0;

							cheatBullets[i].active = 0;
							cheatBullets[i].hide = 1;
							cheatBullets[i].range = 0;
						}
					}

	            } else {
				    for(int i = 0; i < BULLETCOUNT; i++) {
						if(collision(b->worldRow, b->worldCol, b->height, b->width, 
						    		bullets[i].worldRow, bullets[i].worldCol, bullets[i].height, bullets[i].width) 
							&& bullets[i].active) {

							b->active = 0;
							b->hide = 0;
							b->range = 0;

							bullets[i].active = 0;
							bullets[i].hide = 1;
							bullets[i].range = 0;
						}
					}
				}

            	//Player and enemy bullet collision
			    for(int i = 0; i < BULLETCOUNT; i++) {
					if(collision(b->worldRow, b->worldCol, b->height, b->width, 
					    		player.worldRow, player.worldCol, player.height, player.width)) {

						lives--;
						b->active = 0;
						b->hide = 0;
						b->range = 0;
						playSoundB(hurt, HURTLEN, HURTFREQ, 0);

						if(lives == 0) {
							goToLose();
						}
					}
				}

			//Else if boss bullet
			} else if (b->type == 2) {

				//Change boss bulelt direction
				if (b->direction == 0) {
					b->worldCol -= b->cdel; 
				} else if (b->direction == 1) {
					b->worldCol += b->cdel;
				}

            	b->range++;

				//Player bullet and enemy bullet collision
	            if (cheat) {
				    for(int i = 0; i < 10; i++) {
						if(collision(b->worldRow, b->worldCol, b->height, b->width, 
						    		cheatBullets[i].worldRow, cheatBullets[i].worldCol, cheatBullets[i].height, cheatBullets[i].width) 
							&& cheatBullets[i].active) {

							b->active = 0;
							b->hide = 0;
							b->range = 0;

							cheatBullets[i].active = 0;
							cheatBullets[i].hide = 1;
							cheatBullets[i].range = 0;
						}
					}

	            } else {
				    for(int i = 0; i < BULLETCOUNT; i++) {
						if(collision(b->worldRow, b->worldCol, b->height, b->width, 
						    		bullets[i].worldRow, bullets[i].worldCol, bullets[i].height, bullets[i].width) 
							&& bullets[i].active) {

							b->active = 0;
							b->hide = 0;
							b->range = 0;

							bullets[i].active = 0;
							bullets[i].hide = 1;
							bullets[i].range = 0;
						}
					}
				}

            	//Player and enemy bullet collision
			    for(int i = 0; i < BULLETCOUNT; i++) {
					if(collision(b->worldRow, b->worldCol, b->height, b->width, 
					    		player.worldRow, player.worldCol, player.height, player.width)) {

						lives--;
						b->active = 0;
						b->hide = 0;
						b->range = 0;
						playSoundB(hurt, HURTLEN, HURTFREQ, 0);

						if(lives == 0) {
							goToLose();
						}
					}
				}
				
			}//Else normal player bullet
             else {

				if (b->direction == 0 && b->screenRow >= 0 && collisionmapBitmap[OFFSET(b->worldRow - 1, b->worldCol, MAPWIDTH)]
					&& collisionmapBitmap[OFFSET(b->worldRow  - 1, b->worldCol + b->width - 1, MAPWIDTH)]) {
					//up
	            	b->worldRow += b->rdel;
	            	b->range++;
	            } else if (b->direction == 1 && b->screenRow + b->height < 160 && collisionmapBitmap[OFFSET(b->worldRow + b->height , b->worldCol, MAPWIDTH)]
					&& collisionmapBitmap[OFFSET(b->worldRow + b->height, b->worldCol + b->width - 1, MAPWIDTH)]) {
	            	//down
	            	b->worldRow -= b->rdel;
	            	b->range++;
	            } else if (b->direction == 2  && collisionmapBitmap[OFFSET(b->worldRow , b->worldCol  - 1, MAPWIDTH)]
					&& collisionmapBitmap[OFFSET(b->worldRow + b->height - 1, b->worldCol - 1, MAPWIDTH)]) {
	            	//left
	            	b->worldCol -= b->cdel;
	            	b->range++;
	            } else if (b->direction == 3  && collisionmapBitmap[OFFSET(b->worldRow , b->worldCol + b->width, MAPWIDTH)]
					&& collisionmapBitmap[OFFSET(b->worldRow + b->height - 1, b->worldCol + b->width, MAPWIDTH)]) {
	            	//right
	            	b->worldCol += b->cdel;
	            	b->range++;
	            } else {
	            	b->active = 0;
	            	b->hide = 1;
	            	b->range = 0;
	            }
	        }

	}

	b->screenCol = b->worldCol - hOff;
	b->screenRow = b->worldRow - vOff;

}





// Draw the player
void drawPlayer() {

	shadowOAM[player.index].attr0 = (player.screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[player.index].attr1 = (player.screenCol & COLMASK) | ATTR1_MEDIUM;
	shadowOAM[player.index].attr2 = ATTR2_PALROW(0)| ATTR2_TILEID(player.curFrame * 4, player.aniState * 4);
}

//Draw number of hearts on screen
void drawLives(LIFE * h) {
	if (!h->hide) {
		shadowOAM[h->index].attr0 = (h->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[h->index].attr1 = (h->screenCol & COLMASK) | ATTR1_MEDIUM;
		shadowOAM[h->index].attr2 = ATTR2_PALROW(0)| ATTR2_TILEID(8, 16);
	} else {
		shadowOAM[h->index].attr0 |= ATTR0_HIDE;
	}
}

// Draw the player
void drawEnemies(ANISPRITE * e) {

    if (e->active && !e->hide) {
		shadowOAM[e->index].attr0 = (e->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[e->index].attr1 = (e->screenCol & COLMASK) | ATTR1_MEDIUM;
		shadowOAM[e->index].attr2 = ATTR2_PALROW(0)| ATTR2_TILEID(e->curFrame * 4, 20);
	} else {
		shadowOAM[e->index].attr0 |= ATTR0_HIDE;
	}
}

void drawBoss(){
	if (king.active && !king.hide) {
		shadowOAM[40].attr0 = (king.screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[40].attr1 = (king.screenCol & COLMASK) | ATTR1_LARGE;
		shadowOAM[40].attr2 = ATTR2_PALROW(1)| ATTR2_TILEID(king.curFrame * 8, 24);
	} else {
		shadowOAM[king.index].attr0 |= ATTR0_HIDE;
	}
}

// Draw a bullet
void drawBullet(BULLET * b) {

	if(b->active && !b->hide) {
		shadowOAM[b->index].attr0 = (b->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->screenCol & COLMASK) | ATTR1_MEDIUM;
		shadowOAM[b->index].attr2 = ATTR2_PALROW(0)| ATTR2_TILEID(0, 16);
	} else {
		shadowOAM[b->index].attr0 |= ATTR0_HIDE;
	}
}

// Draw enemy bullets
void drawEnemyBullet(BULLET * b) {

	if(b->active && !b->hide) {
		shadowOAM[b->index].attr0 = (b->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->screenCol & COLMASK) | ATTR1_MEDIUM;
		shadowOAM[b->index].attr2 = ATTR2_PALROW(0)| ATTR2_TILEID(4, 16);
	} else {
		shadowOAM[b->index].attr0 |= ATTR0_HIDE;
	}
}


// Draw enemy bullets
void drawBossBullet(BULLET * b) {

	if(b->active && !b->hide) {
		shadowOAM[b->index].attr0 = (b->screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[b->index].attr1 = (b->screenCol & COLMASK) | ATTR1_LARGE;
		shadowOAM[b->index].attr2 = ATTR2_PALROW(1)| ATTR2_TILEID(12, 16);
	} else {
		shadowOAM[b->index].attr0 |= ATTR0_HIDE;
	}
}

// Spawn a bullet
void fireBullet() {


	player.curFrame = 2;


	if (cheat) {
		// Find the first inactive bullet
		for (int i = 0; i < 10; i++) {
			if (!cheatBullets[i].active) {

				// Position the new bullet
				cheatBullets[i].worldRow = player.worldRow;
				cheatBullets[i].worldCol = player.worldCol;

				if (player.aniState == PLAYERFRONT) {
	            	cheatBullets[i].direction = 0;
	            } else if (player.aniState == PLAYERBACK) {
	            	cheatBullets[i].direction = 1;
	            } else if (player.aniState == PLAYERLEFT) {
	            	cheatBullets[i].direction = 2;
	            } else if (player.aniState == PLAYERRIGHT) {
	            	cheatBullets[i].direction = 3;
	            }

				// Take the bullet out of the pool
				cheatBullets[i].active = 1;
				cheatBullets[i].hide = 0;
				playSoundB(slash_c1, SLASHLEN, SLASHFREQ, 0);

				// Break out of the loop
				break;
			}
		}

	} else {
		// Find the first inactive bullet
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (!bullets[i].active) {

				// Position the new bullet
				bullets[i].worldRow = player.worldRow;
				bullets[i].worldCol = player.worldCol;

				if (player.aniState == PLAYERFRONT) {
	            	bullets[i].direction = 0;
	            } else if (player.aniState == PLAYERBACK) {
	            	bullets[i].direction = 1;
	            } else if (player.aniState == PLAYERLEFT) {
	            	bullets[i].direction = 2;
	            } else if (player.aniState == PLAYERRIGHT) {
	            	bullets[i].direction = 3;
	            }

				// Take the bullet out of the pool
				bullets[i].active = 1;
				bullets[i].hide = 0;
				playSoundB(slash_c1, SLASHLEN, SLASHFREQ, 0);

				// Break out of the loop
				break;
			}
		}

	}

}

void fireEnemyBullet() {

	if(!isBoss) {
		// Find the first inactive bullet
		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
			if(enemies[i].active && !enemies[i].hide) {
				if (!enemyBullets[i].active) {

					// Position the new bullet
					enemyBullets[i].worldRow = enemies[i].worldRow;
					enemyBullets[i].worldCol = enemies[i].worldCol;

					// Take the bullet out of the pool
						enemyBullets[i].active = 1;
						enemyBullets[i].hide = 0;
						playSoundB(fireball, FIREBALLLEN, FIREBALLFREQ, 0);
					
					// Break out of the loop
					break;
				}
			}
		}

	} else {


		// Find the first inactive boss bullet
		for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
			if(king.active && !king.hide) {
				if (!bossBullets[i].active) {

					// Position the new bullet
					bossBullets[i].worldRow = king.worldRow;
					bossBullets[i].worldCol = king.worldCol;

					// Take the bullet out of the pool
						bossBullets[i].active = 1;
						bossBullets[i].hide = 0;
						playSoundB(fireball, FIREBALLLEN, FIREBALLFREQ, 0);
					
					// Break out of the loop
					break;
				}
			}
		}
	}
	


}

























// ***Sounds ===============================================================================


void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;
	
        //TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values (excluding priority)
        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.priority = 0;
        soundA.duration = VBLANK_FREQ * length / frequency;
        soundA.vbCount = 0;
        soundA.isPlaying = 1;
        soundA.loops = loops;
        
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        // TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.priority = 0;
        soundB.duration = VBLANK_FREQ * length / frequency;
        soundB.vbCount = 0;
        soundB.isPlaying = 1;
        soundB.loops = loops;
}

void pauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;

	REG_TM0CNT = 0;
	REG_TM1CNT = 0;

	
}

void unpauseSound()
{
	// TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 1;
	soundB.isPlaying = 1;

	REG_TM0CNT = TIMER_ON;
	REG_TM1CNT = TIMER_ON;
	
}

void stopSound()
{
    // TODO: WRITE THIS FUNCTION
	soundA.isPlaying = 0;
	soundB.isPlaying = 0;

	REG_TM0CNT = 0;
	REG_TM1CNT = 0;

	dma[1].cnt = 0;
	dma[2].cnt = 0;
}

void setupInterrupts()
{
	REG_IME = 0;
	// TODO: SET UP THE INTERRUPT HANDLER HERE
	// HINT: THERE IS A REGISTER THAT NEEDS TO POINT TO A INTERRUPT FUNCTION
	// HINT: THAT INTERRUPT FUNCTION HAS TO BE CAST TO SOMETHING...
	REG_INTERRUPT = (unsigned int)interruptHandler;
	
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		//TODO: FINISH THIS FUNCTION
		// This should be where you determine if a sound if finished or not

		if (soundA.isPlaying) {
			soundA.vbCount++;
			if(soundA.vbCount >= soundA.duration) {
				if (soundA.loops) {
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					soundA.isPlaying = 0;
					dma[1].cnt = 0;
					REG_TM0CNT = 0;

				}
			}
		}


		if (soundB.isPlaying) {
			soundB.vbCount++;
			if(soundB.vbCount >= soundB.duration) {
				if (soundB.loops) {
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				} else {
					soundB.isPlaying = 0;
					dma[2].cnt = 0;
					REG_TM1CNT = 0;

				}
			}
		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}
