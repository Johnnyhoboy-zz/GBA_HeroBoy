
//{{BLOCK(end)

//======================================================================
//
//	end, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 549 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17568 + 2048 = 20128
//
//	Time-stamp: 2017-12-05, 22:30:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_END_H
#define GRIT_END_H

#define endTilesLen 17568
extern const unsigned short endTiles[8784];

#define endMapLen 2048
extern const unsigned short endMap[1024];

#define endPalLen 512
extern const unsigned short endPal[256];

#endif // GRIT_END_H

//}}BLOCK(end)
