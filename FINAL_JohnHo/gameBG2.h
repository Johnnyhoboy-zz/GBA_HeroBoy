
//{{BLOCK(gameBG2)

//======================================================================
//
//	gameBG2, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 226 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 7232 + 8192 = 15936
//
//	Time-stamp: 2017-12-05, 12:54:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG2_H
#define GRIT_GAMEBG2_H

#define gameBG2TilesLen 7232
extern const unsigned short gameBG2Tiles[3616];

#define gameBG2MapLen 8192
extern const unsigned short gameBG2Map[4096];

#define gameBG2PalLen 512
extern const unsigned short gameBG2Pal[256];

#endif // GRIT_GAMEBG2_H

//}}BLOCK(gameBG2)
