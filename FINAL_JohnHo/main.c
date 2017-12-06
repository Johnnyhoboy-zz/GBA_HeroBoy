
/*****************************************

This is an RPG-inspired side scrolling fighting game. The objective is to kill all
enemies in the area to save the village. You are a hero passing by and they need your help!
With your sword and special move (A) you set off to finish the quest.

There are only a few minor bugs I didn't have time to fix:
*At the start of the game, a random enemmy bullet will fire but will not cause damage,
 not sure where the root cause is but its a very minor graphic bug.

*Sometimes the pig enemies may fire after you killed them, I believe this is a minor
 issue with the death animation frame timer I put to show a nice death animation.

*I tried best as I could to move enemies without them going into trees or walls, but this
 is as good of calculations as it goes for the map. Might not actually bother you too much.

Things I believe might be extra credit:
-Custom unique art style from RPGmaker, took a while to get the tiles correctly as
 GBA only supports 1024 unique tiles.
-Spent time drawing out nice sprite animations and death animations
-Added a TON of sound effects (projectiles, enemies, all state screens, battle music)
-Was planning on making a second map but sadly ran into major bugs, however the assets
 for that are all still in the folder, just un-used.


I very much enjoyed this class and the TAs :)


******************************************/


#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h" 
#include "startBg.h"
#include "startBg2.h"
#include "info.h"
#include "gameBG.h"
#include "Pause.h"
#include "lose.h"
#include "Win.h"
#include "introBG.h"
#include "transitionBG.h"
#include "finalBG.h"
#include "spritesheet.h"
#include "menuMusic.h"
#include "text.h"
#include "battle.h"
#include "lost.h"
#include "gameBG2.h"
#include "slimeboss.h"
#include "end.h"
#include "victory.h"

// Prototypes
void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();

void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToInfo();
void info();
void goToIntro();
void intro();
void goToTransition();
void transition();
void final();
void goToFinal();
void end();
void goToEnd();


// States
enum {START, GAME, PAUSE, WIN, LOSE, INFO, INTRO, TRANSITION, FINAL, END};
int state;
int menu;
int cheat;
int isBoss = 0;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// OAM Buffer
OBJ_ATTR shadowOAM[128];

//Sound
SOUND soundA;
SOUND soundB;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
    
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case INFO:
                info();
                break;
            case INTRO:
            	intro();
            	break;
            case TRANSITION:
            	transition();
            	break;
            case FINAL:
            	final();
            	break;
            case END:
            	end();
            	break;

        }

               
    }
}

// Sets up GBA
void initialize() {

    //Setup sounds
    setupInterrupts();
    setupSounds();

    //Menu Sound
    playSoundA(menuMusic,MENUMUSICLEN,MENUMUSICFREQ, 1);

    // Set up the first state
    goToStart();


}

// Sets up the start state
void goToStart() {

    waitForVBlank();


    // Load the background
    loadPalette(startBgPal);
    DMANow(3, startBgTiles, &CHARBLOCK[0], startBgTilesLen/2);
    DMANow(3, startBgMap, &SCREENBLOCK[31], startBgMapLen/2);

    // Set up and show the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = START;
    menu = 0;
    cheat = 0;
}

// Runs every frame of the start state
void start() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_SELECT)) {
    	cheat = 1;
    }

    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        // Load the background 2
        loadPalette(startBg2Pal);
        DMANow(3, startBg2Tiles, &CHARBLOCK[0], startBg2TilesLen/2);
        DMANow(3, startBg2Map, &SCREENBLOCK[31], startBg2MapLen/2);
        menu = 1;

    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        // Load the background 1
        loadPalette(startBgPal);
        DMANow(3, startBgTiles, &CHARBLOCK[0], startBgTilesLen/2);
        DMANow(3, startBgMap, &SCREENBLOCK[31], startBgMapLen/2);
        menu = 0;
    }
    // State transitions
    if ((BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) && !menu) {

        goToIntro();

    } else if ((BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) && menu) {
        goToInfo();
    }
}

// Sets up the game state
void goToGame() {

    //stop menu sound
    stopSound();
    if(isBoss) {
    	playSoundA(slimeboss, SLIMEBOSSLEN, SLIMEBOSSFREQ, 1);
    } else {
    	playSoundA(battle, BATTLELEN, BATTLEFREQ, 1);
    }

    // Set up and show the background and sprites
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;


    // Load the background
    loadPalette(gameBGPal);
    DMANow(3, gameBGTiles, &CHARBLOCK[0], gameBGTilesLen/2);
    DMANow(3, gameBGMap, &SCREENBLOCK[28], gameBGMapLen/2);

    // Load the sprites
    DMANow(3, spriteSheetPal, SPRITEPALETTE, 256);
    DMANow(3, spriteSheetTiles, &CHARBLOCK[4], spriteSheetTilesLen/2);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(4) | BG_SCREENBLOCK(27);
    hideSprites();

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, shadowOAM, OAM, 128*4);


    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();

    drawGame();

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    else if (lives == 0)
        goToLose();
    else if (enemiesRemaining == 0 && isBoss) {
    	goToFinal();
    }
    else if (enemiesRemaining == 0)
        goToTransition();
}


// Sets up the pause state
void goToPause() {
    
    waitForVBlank();

    //Pause sound
    pauseSound();

    // Load the background
    loadPalette(PausePal);
    DMANow(3, PauseTiles, &CHARBLOCK[0], PauseTilesLen/2);
    DMANow(3, PauseMap, &SCREENBLOCK[31], PauseMapLen/2);

    // Set up and show the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        	goToGame();
        
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        //Menu Sound
        playSoundA(menuMusic,MENUMUSICLEN,MENUMUSICFREQ, 1);
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    
    waitForVBlank();

    // Load the background
    loadPalette(WinPal);
    DMANow(3, WinTiles, &CHARBLOCK[0], WinTilesLen/2);
    DMANow(3, WinMap, &SCREENBLOCK[31], WinMapLen/2);

    // Set up and show the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = WIN;
}

// Runs every frame of the win state
void win() {
    
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)){
        //Menu Sound
        playSoundA(menuMusic,MENUMUSICLEN,MENUMUSICFREQ, 1);
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    
    waitForVBlank();

	stopSound();

	playSoundA(lost, LOSTLEN, LOSTFREQ, 0);

    // Load the lose background
    loadPalette(losePal);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen/2);
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen/2);

    // Set up and show the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE| BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)){
        //Menu Sound
         playSoundA(menuMusic,MENUMUSICLEN,MENUMUSICFREQ, 1);
        goToStart();
    }
}

//Instruction screen
void goToInfo() {

    waitForVBlank();

    // Load the info background
    loadPalette(infoPal);
    DMANow(3, infoTiles, &CHARBLOCK[0], infoTilesLen/2);
    DMANow(3, infoMap, &SCREENBLOCK[31], infoMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = INFO;
}

//Info State
void info() {

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START) || (BUTTON_PRESSED(BUTTON_A))) 
        goToStart();
}

//Intro screen after start
void goToIntro() {
	waitForVBlank();

	stopSound();

	playSoundA(text, TEXTLEN, TEXTFREQ, 0);

    // Load the info background
    loadPalette(introBGPal);
    DMANow(3, introBGTiles, &CHARBLOCK[0], introBGTilesLen/2);
    DMANow(3, introBGMap, &SCREENBLOCK[31], introBGMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = INTRO;

}

void intro() {

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A)) 
        goToGame();
        hOff = 0;
        vOff = 0;
        initGame();
}


//Halfway screen in game
void goToTransition() {
	waitForVBlank();

	stopSound();
	playSoundA(text, TEXTLEN, TEXTFREQ, 0);

    // Load the info background
    loadPalette(transitionBGPal);
    DMANow(3, transitionBGTiles, &CHARBLOCK[0], transitionBGTilesLen/2);
    DMANow(3, transitionBGMap, &SCREENBLOCK[31], transitionBGMapLen/2);


    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = TRANSITION;

}


void transition() {

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	enemiesRemaining = 1;
    	initBossGame();
        goToGame();
    }
}

//Transition to final
void goToFinal() {
	waitForVBlank();

	stopSound();
	playSoundA(text, TEXTLEN, TEXTFREQ, 0);

    // Load the info background
    loadPalette(finalBGPal);
    DMANow(3, finalBGTiles, &CHARBLOCK[0], finalBGTilesLen/2);
    DMANow(3, finalBGMap, &SCREENBLOCK[31], finalBGMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = FINAL;

}


void final() {

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	goToEnd();
    }
        
}

//Transition to final
void goToEnd() {
	waitForVBlank();

	stopSound();
	playSoundA(victory, VICTORYLEN, VICTORYFREQ, 0);

    // Load the info background
    loadPalette(endPal);
    DMANow(3, endTiles, &CHARBLOCK[0], endTilesLen/2);
    DMANow(3, endMap, &SCREENBLOCK[31], endMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = END;

}


void end() {

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	playSoundA(menuMusic,MENUMUSICLEN,MENUMUSICFREQ, 1);
    	goToStart();
    }
        
}