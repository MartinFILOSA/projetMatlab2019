function [] = creerVideo( F, v2)

    video = VideoWriter('video.mp4','MPEG-4');
    video.FrameRate = v2.FrameRate;
    open(video);
    for i=1:length(F)
        frame = F(i);
        writeVideo(video, frame);
    end
    close(video);
end