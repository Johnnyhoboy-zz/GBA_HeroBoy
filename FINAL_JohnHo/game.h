// Generic struct for animated sprite
typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
    int index;
    int hide;
    int dieCounter;
    int hits;
} ANISPRITE;

// Bullet Struct
typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	int active;
	int index;
    int direction;
    int range;
    int hide;
    int type;
} BULLET;

typedef struct {
    int screenRow;
    int screenCol;
    int hide;
    int index;
} LIFE;

//Sound
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

extern SOUND soundA;
extern SOUND soundB;

// Constants
#define BULLETCOUNT 1
#define ENEMYCOUNT 5
#define LIFECOUNT 3
#define ENEMYBULLETCOUNT 5
#define MAPHEIGHT 512
#define MAPWIDTH 512

// Variables
extern ANISPRITE player;
extern ANISPRITE king;
extern LIFE hearts[LIFECOUNT];

extern BULLET bullets[BULLETCOUNT];
extern BULLET cheatBullets[10];
extern BULLET enemyBullets[ENEMYBULLETCOUNT];
extern BULLET bossBullets[ENEMYBULLETCOUNT];
extern int enemiesRemaining;

extern int lives;
extern int direction;
extern int cheat;
extern int isBoss;

// Background offsets
extern int hOff;
extern int vOff;

// Prototypes
void initGame();
void updateGame();
void drawGame();

void initBossGame();
void initBoss();
void drawBoss();
void updateBoss();
void drawBossBullet(BULLET *);

void goToLose();
void initLives();
void updateLives();
void drawLives(LIFE *);

void initPlayer();
void updatePlayer();
void drawPlayer();

void initEnemies();
void updateEnemies(ANISPRITE *);
void drawEnemies(ANISPRITE *);

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);
void drawEnemyBullet();
void fireEnemyBullet();

//Sounds
void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void pauseSound();
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();

