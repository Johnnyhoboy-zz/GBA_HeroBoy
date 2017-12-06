
//{{BLOCK(introBG)

//======================================================================
//
//	introBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 325 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10400 + 2048 = 12960
//
//	Time-stamp: 2017-12-04, 06:26:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INTROBG_H
#define GRIT_INTROBG_H

#define introBGTilesLen 10400
extern const unsigned short introBGTiles[5200];

#define introBGMapLen 2048
extern const unsigned short introBGMap[1024];

#define introBGPalLen 512
extern const unsigned short introBGPal[256];

#endif // GRIT_INTROBG_H

//}}BLOCK(introBG)
