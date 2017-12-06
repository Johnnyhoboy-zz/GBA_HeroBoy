
//{{BLOCK(gameBG)

//======================================================================
//
//	gameBG, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 636 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 20352 + 8192 = 29056
//
//	Time-stamp: 2017-11-30, 23:14:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBGTilesLen 20352
extern const unsigned short gameBGTiles[10176];

#define gameBGMapLen 8192
extern const unsigned short gameBGMap[4096];

#define gameBGPalLen 512
extern const unsigned short gameBGPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBG)
