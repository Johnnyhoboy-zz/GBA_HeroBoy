
//{{BLOCK(finalBG)

//======================================================================
//
//	finalBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 319 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10208 + 2048 = 12768
//
//	Time-stamp: 2017-12-04, 06:34:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FINALBG_H
#define GRIT_FINALBG_H

#define finalBGTilesLen 10208
extern const unsigned short finalBGTiles[5104];

#define finalBGMapLen 2048
extern const unsigned short finalBGMap[1024];

#define finalBGPalLen 512
extern const unsigned short finalBGPal[256];

#endif // GRIT_FINALBG_H

//}}BLOCK(finalBG)
