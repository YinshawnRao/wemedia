# Demo Output

Date: 2026-05-10

## Output

- HyperFrames project: `sandbox/hyperframes/experiment-001/`
- Demo MP4: `sandbox/exports/experiment-001/space-flame-demo.mp4`
- Demo MP4 with voiceover: `sandbox/exports/experiment-001/space-flame-demo-voiceover.mp4`
- Contact sheet: `sandbox/exports/experiment-001/space-flame-demo-contact-sheet.jpg`
- Narration audio: `sandbox/hyperframes/experiment-001/assets/narration.wav`

## Specs

- Resolution: `1080x1920`
- Aspect ratio: `9:16`
- Frame rate: `30fps`
- Duration: `40.021s`
- Video codec: `H.264`
- Audio codec: `AAC`
- File size without voiceover: about `4.8 MB`
- File size with voiceover: about `5.4 MB`

## Checks

- `npx hyperframes lint`: 0 errors, 0 warnings
- `npx hyperframes inspect --samples 10`: 0 layout issues
- `npx hyperframes render --quality draft`: completed
- `ffprobe`: output file is valid 1080x1920 MP4
- Voiceover render: valid AAC audio track, mean volume about `-19.6 dB`, max volume about `-4.8 dB`

## Notes

- The original YouTube clip had sparse keyframes. It was re-encoded to `assets/flame-reduced-gravity-keyed.mp4` with a shorter GOP before final render.
- Initial demo used no voiceover. A second version adds local macOS `say` Chinese narration using the `Tingting` voice.
- Noiz TTS was attempted first but returned a server-side 500 for the first segment, so local TTS was used as the stable fallback for this sandbox demo.
- This is still a sandbox demo, not a publish-ready final.
