# Experiment 003 Download Plan

All downloads use `WEMEDIA_OUTPUT_MODE=test` and save to `sandbox/yt-dlp/clips/<slug>/`. Each planned download is a short time-range clip, not a full-video ingest.

## YouTube Plan Kept for Research

The first plan below records the original YouTube-first research path. During execution, unauthenticated YouTube clip download was blocked by bot verification, and browser-cookie access was not used further. The production path for this sandbox run therefore switches to public direct media URLs from government/public-domain repositories.

| # | Slug | URL | Start | End | Intended Use | Expected Folder | Rights Note |
|---|---|---|---|---|---|---|---|
| 1 | `space-iss-lab` | https://www.youtube.com/watch?v=5GeAORj0Nw0 | `00:00:05` | `00:00:20` | Open with orbital lab imagery and source narration. | `sandbox/yt-dlp/clips/space-iss-lab/` | NASA official; review before publish. |
| 2 | `ocean-coral-restoration` | https://www.youtube.com/watch?v=MR9TCBDIja4 | `00:00:06` | `00:00:21` | Reef restoration sequence with source narration. | `sandbox/yt-dlp/clips/ocean-coral-restoration/` | NOAA official; review before publish. |
| 3 | `volcano-kilauea-history` | https://www.youtube.com/watch?v=qnCt9G9rtAI | `00:00:05` | `00:00:20` | Historic eruption explanation with source narration. | `sandbox/yt-dlp/clips/volcano-kilauea-history/` | USGS official; review archival inserts. |
| 4 | `parks-nps-100` | https://www.youtube.com/watch?v=4aBYXooaSqE | `00:00:06` | `00:00:21` | Public-lands montage with source voice/music. | `sandbox/yt-dlp/clips/parks-nps-100/` | NPS official; review music/footage. |
| 5 | `health-data-visualized` | https://www.youtube.com/watch?v=I-tH_juih4w | `00:00:10` | `00:00:25` | Classroom-style data visualization explanation. | `sandbox/yt-dlp/clips/health-data-visualized/` | CDC official; review terms. |
| 6 | `history-library-of-congress` | https://www.youtube.com/watch?v=63Ze_bpATac | `00:00:07` | `00:00:22` | Archive/public memory setup with source narration. | `sandbox/yt-dlp/clips/history-library-of-congress/` | LOC official; rights review. |
| 7 | `food-organic-program` | https://www.youtube.com/watch?v=ULnBwGa5nwI | `00:00:08` | `00:00:23` | Organic label explainer with source narration. | `sandbox/yt-dlp/clips/food-organic-program/` | USDA AMS official; review before publish. |
| 8 | `wildlife-usfws-mission` | https://www.youtube.com/watch?v=ofARYgeyi6g | `00:00:03` | `00:00:18` | Conservation mission montage with source narration. | `sandbox/yt-dlp/clips/wildlife-usfws-mission/` | USFWS official; review before publish. |
| 9 | `aviation-structural-safety` | https://www.youtube.com/watch?v=g0F7GZ_0940 | `00:00:03` | `00:00:18` | Aircraft structure/safety hook with source narration. | `sandbox/yt-dlp/clips/aviation-structural-safety/` | FAA official; review before publish. |
| 10 | `earth-know-your-earth` | https://www.youtube.com/watch?v=AebYmI6FfJo | `00:00:08` | `00:00:23` | Earth-observation science hook with source narration. | `sandbox/yt-dlp/clips/earth-know-your-earth/` | NASA Goddard official; review before publish. |

## Final Direct-Source Clip Plan

These are the clips actually used for the 10 sandbox shorts. They avoid browser cookies and use public direct media URLs.

| # | Slug | Source URL | Start | Duration | Intended Use | Expected Clip | Rights Note |
|---|---|---|---|---|---|---|---|
| 1 | `space-shuttle-machine` | https://archive.org/download/gov.archives.arc.1157922/gov.archives.arc.1157922_512kb.mp4 | `00:00:28` | `15s` | Space shuttle as engineered flying machine. | `sandbox/yt-dlp/clips/space-shuttle-machine/source.mp4` | FedFlix / U.S. government public-domain collection. |
| 2 | `ocean-coral-economy` | https://oceanexplorer.noaa.gov/wp-content/uploads/2018/08/reef-conversation-640x360-1.mp4 | `00:00:00` | `15s` | Coral reefs as living field evidence, not background scenery. | `sandbox/yt-dlp/clips/ocean-coral-economy/source.mp4` | NOAA direct MP4; official source. |
| 3 | `volcano-kilauea` | https://archive.org/download/fc-fc-475/fc-fc-475.mp4 | `00:00:18` | `15s` | Kilauea as active geology and public memory. | `sandbox/yt-dlp/clips/volcano-kilauea/source.mp4` | FedFlix / National Archives public-domain collection. |
| 4 | `health-droplets-basics` | https://stacks.cdc.gov/view/cdc/153816/cdc_153816_DS1.mp4 | `00:00:00` | `15s` | Respiratory droplets as a small everyday public-health mechanism. | `sandbox/yt-dlp/clips/health-droplets-basics/source.mp4` | CDC Stacks public-domain video. |
| 5 | `history-gpo-printing` | https://archive.org/download/TheGpoHistoryMovie/GPO_History_Final_Large_512kb.mp4 | `00:00:12` | `15s` | Public printing as government memory infrastructure. | `sandbox/yt-dlp/clips/history-gpo-printing/source.mp4` | FedFlix / public-domain collection. |
| 6 | `food-safer-sprouts` | https://archive.org/download/gov.ca.dhs.sprouts.1/gov.ca.dhs.sprouts.1_512kb.mp4 | `00:00:12` | `15s` | Food safety through a humble ingredient. | `sandbox/yt-dlp/clips/food-safer-sprouts/source.mp4` | FedFlix / government public-health training. |
| 7 | `wildlife-chincoteague` | https://archive.org/download/gov.fws.aws.3.4/gov.fws.aws.3.4_512kb.mp4 | `00:00:24` | `15s` | Wildlife refuge as habitat and public stewardship. | `sandbox/yt-dlp/clips/wildlife-chincoteague/source.mp4` | FedFlix / U.S. Fish & Wildlife Service. |
| 8 | `aviation-general` | https://archive.org/download/gov.ntis.ava12749vnb/ava12749vnb1_512kb.mp4 | `00:00:32` | `15s` | General aviation as everyday infrastructure. | `sandbox/yt-dlp/clips/aviation-general/source.mp4` | FedFlix / FAA public-domain item. |
| 9 | `infrastructure-dam-safety` | https://archive.org/download/gov.fema.p-718dvd.2/gov.fema.p-718dvd.2_512kb.mp4 | `00:01:02` | `15s` | Dam foundations as invisible safety work. | `sandbox/yt-dlp/clips/infrastructure-dam-safety/source.mp4` | FedFlix / FEMA public-domain item. |
| 10 | `aquaculture-fish-spawning` | https://archive.org/download/gov.usda.srac.sp330/gov.usda.srac.sp330_512kb.mp4 | `00:00:26` | `15s` | Aquaculture science as food-system technique. | `sandbox/yt-dlp/clips/aquaculture-fish-spawning/source.mp4` | FedFlix / USDA-related public-domain item. |
