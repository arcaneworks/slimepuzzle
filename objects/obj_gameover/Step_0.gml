/// @description Insert description here
// You can write your code in this editor
if(skipGameOver && nextLevel){
		
	TransitionStart(newRoom,sqSlideOutDiagonal,sqSlideInDiagonal);
}

if(!skipGameOver && nextLevel && next_level_pressed()){
	
	TransitionStart(newRoom,sqFadeOut,sqFadeIn);
	
}