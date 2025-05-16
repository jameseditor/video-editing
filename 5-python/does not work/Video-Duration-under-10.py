import os
from moviepy.editor import VideoFileClip

# Set the folder where your video files are located
video_folder = r"D:\Videos\Clients\2-Non-Active\Levi Zadoff - Rapper\Footage\DonnaBlood"

# Supported video file extensions
video_extensions = ('.mp4', '.mov', '.avi', '.mkv', '.webm')

# Counter for videos under 10 seconds
short_videos_count = 0

# Loop through all files in the folder
for filename in os.listdir(video_folder):
    if filename.lower().endswith(video_extensions):
        video_path = os.path.join(video_folder, filename)
        try:
            clip = VideoFileClip(video_path)
            duration = clip.duration  # duration in seconds
            clip.reader.close()  # clean up resources
            if clip.audio:
                clip.audio.reader.close_proc()
            if duration < 10:
                short_videos_count += 1
                print(f"{filename} → {duration:.2f} seconds")
        except Exception as e:
            print(f"Error reading {filename}: {e}")

print(f"\nTotal videos under 10 seconds: {short_videos_count}")
