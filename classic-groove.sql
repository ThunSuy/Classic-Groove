-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 11, 2025 lúc 05:08 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `classic-groove`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `album`
--

CREATE TABLE `album` (
  `maAlbum` int(11) NOT NULL,
  `tenAlbum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gia` int(11) DEFAULT NULL,
  `moTa` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hinh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tacGia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `soLuong` int(11) DEFAULT NULL,
  `theLoai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `album`
--

INSERT INTO `album` (`maAlbum`, `tenAlbum`, `gia`, `moTa`, `hinh`, `tacGia`, `TrangThai`, `soLuong`, `theLoai`) VALUES
(1, 'Evo Sessions', 100, 'Evosound proudly presents Chlara\'s evo sessions with 11 tracks on the LP of her favorite classic songs, mainly with acoustic accompaniment. These famous classic songs can resonate throughout different generations from early 20\'s to 21st century like \"Love Me Tender\" or \"Stay With Me\". Chlara is a British-born singer / songwriter recognised as an acoustic songbird, learned to sing and play guitar when she was a young teenager. \"evo sessions\" is her third album release in 4 years. Chlara is not only young and pretty, she possess a lovely sweet voice, and when you hear her sing with a high dynamic range, you can totally feel the passion and energy she puts into her songs. Included in this album is a song she wrote herself called \"Bliss\". The audio of evo sessions was recorded during a live video shoot. The idea of evo sessions started since 2017 summer, the live music video was shot in studio and because of the fabulous sound quality, evosound decided to release as a full album.', 'EvoSessions-Chlara.jpg', 'Chlara', 1, 99999, 2),
(3, 'It Serves You Right To Suffer', 50, '180-gram 45 RPM double LP Mastered at AcousTech Mastering Plated and pressed at Quality Record PressingsIt\'s back in stock! Newly repressed at 45 RPM by Quality Record Pressings. This recording was originally mastered at the former AcousTech Mastering facility and the sound is fantastic.John Lee Hooker himself did not know his exact date of birth. If he hadn\'t died at around the age of 80, this ageless musician would still be easily pulling the next generation to his gigs. Hooker remains a phenomenon, a mysterious figure of black rhythm and blues, a charismatic king who reigns supreme in rock \'n\' roll\'s Hall of Fame. John W. Peters described his music as a synthesis of scorching emotional ardour, unrelenting rhythmic intensity, and original poetry of a highly personal character. Anyone hearing him for the first time may well be startled at the unfiltered passion and power of his music.', 'ItServeYouRightToSuffer-JohnLeeHooker.jpg', 'John Lee Hooker', 1, 99999, 1),
(4, 'Love For Sale', 70, 'Celebrating 10 years since they first recorded together, Tony Bennett ', 'LoveForSale-TonyBennett_LadyGaga.jpg', 'Tony Bennett ', 1, 99999, 6),
(5, 'Dawn FM', 60, 'he Weeknd deemed his 2022 album, Dawn FM, a \"sonic experience\" showcasing a unique cast of features from Tyler, the Creator, Lil Wayne, Quincy Jones, Oneohtrix Point Never, and Jim Carrey. (XO Records/Republic)', 'DawnFM-TheWeeknd.jpg', 'TheWeeknd', 1, 99999, 5),
(6, 'Fearless (Taylor’s Version) Gold', 85, '\"Fearless was an album full of magic and curiosity, the bliss and devastation of youth. It was the diary of the adventures and explorations of a teenage girl who was learning tiny lessons with every new crack in the facade of the fairytale ending she\'d been shown in the movies. I\'m thrilled to tell you that my new version of Fearless is done and will be with you soon. It\'s called Fearless (Taylor\'s Version) and it includes 26 songs.\" - Taylor Swift. Includes 6 unreleased tracks. Gold 3 LP.', 'Fearless-TaylorSwift.jpg', 'Taylor Swift', 1, 99996, 4),
(7, 'Beleive', 60, 'Internationally renowned Italian tenor Andrea Bocelli releases breathtaking new album, Believe, celebrating the power of music to soothe the soul. It follows his record-breaking `Music for Hope\' performance at Easter from Milan\'s historic Duomo cathedral. Features classic favorites, a previously unreleased track from late Italian composer Ennio Morricone, Gratia Plena (from acclaimed film Fatima), duets w/ Alison Krauss ', 'Believe-AndreaBocelli.jpg', 'Andrea Bocelli', 1, 99999, 3),
(8, 'Jordi', 70, 'The eagerly awaited new album from Maroon 5, JORDI, is the band\'s first since the critically acclaimed Red Pill Blues. The album will include the recently released hit single \"Beautiful Mistakes ft. Megan Thee Stallion\" as well as fan favorites \"Memories\" and \"Nobody\'s Love.\" Vinyl LP pressing. 2021 album.', 'Jordi-Maroon5.jpg', 'Maroon 5', 1, 99997, 7),
(9, 'All 4 Nothing', 80, '\"ALL 4 NOTHING\" by LAUV is a heartfelt pop album that dives into themes of love, self-acceptance, and emotional healing. Blending dreamy melodies with introspective lyrics, LAUV takes listeners on a personal journey of growth, vulnerability, and finding peace within oneself.', 'Believe-AndreaBocelli.jpg', 'Lauv', 1, 99997, 7),
(10, 'Stay With Me', 30, '\"Stay With Me\" by Chlara is a soothing acoustic ballad that captures the longing and tenderness of wanting someone to stay. With her soft, emotive vocals and gentle guitar melodies, Chlara delivers a heartfelt performance filled with warmth, vulnerability, and quiet strength.', 'EvoSessions-Chlara.jpg', 'Chlara', 1, 99999, 2),
(11, 'Ocean Deep', 30, '\"Ocean Deep\" by Cliff Richard is a timeless love ballad that expresses deep emotions of unrequited love and longing. With heartfelt vocals and a sweeping melody, the song beautifully conveys the feeling of being lost in love—like drifting endlessly in a vast emotional ocean.', 'EvoSessions-Chlara.jpg', 'Chlara', 1, 99999, 2),
(12, 'Stranger', 25, '\"Stranger\" by LAUV is a reflective and emotional track that explores the feeling of disconnection in a once-close relationship. With atmospheric production and raw, honest lyrics, LAUV captures the bittersweet reality of growing distant from someone who used to feel so familiar.', 'Believe-AndreaBocelli.jpg', 'Lauv', 1, 99999, 7),
(13, 'True Colours', 20, '\"True Colours\" by Chlara is a soft, acoustic cover that brings a fresh intimacy to the classic anthem. With her warm, soothing vocals and stripped-back arrangement, Chlara delivers a heartfelt rendition that highlights the song’s message of love, acceptance, and staying true to oneself.', 'EvoSessions-Chlara.jpg', 'Chlara', 1, 99999, 2),
(15, 'Beautiful Mistakes', 30, '\"Beautiful Mistakes\" by Maroon 5 is a catchy pop track that blends emotional reflection with upbeat vibes. Featuring Megan Thee Stallion, the song explores the lingering thoughts of a past relationship, turning regrets into bittersweet memories through smooth vocals, dreamy melodies, and a touch of rap.', 'Jordi-Maroon5.jpg', 'Maroon 5', 1, 99997, 7),
(16, 'Greensleeves', 20, '\"Greensleeves\" by Kenny Burrell is a beautiful jazz interpretation of the traditional English folk melody. With his signature warm tone and elegant phrasing, Burrell transforms the classic tune into a soulful, introspective piece, blending timeless tradition with modern jazz sophistication.', 'kennyburrelllp.png', 'Kenny Burrell', 1, 99999, 2),
(17, 'Downstairs', 40, '\"Downstairs\" by Kenny Burrell is a smooth, blues-infused jazz track that highlights his masterful guitar work and deep sense of groove. With its laid-back rhythm and rich harmonic textures, the piece captures the intimate, late-night vibe that Burrell is known for, blending sophistication with soul.', 'kennyburrelllp.png', 'Kenny Burrell', 1, 99998, 2),
(18, 'Excerpts From Prelude', 30, '\"Excerpts from Prelude\" by Kenny Burrell is a contemplative and elegant piece that showcases his classical influence and nuanced guitar technique. Blending elements of jazz and classical music, the track creates a serene, almost meditative atmosphere, highlighting Burrell’s expressive range and refined artistry.', 'kennyburrelllp.png', 'Kenny Burrell', 1, 99999, 2),
(19, 'Guitar Forms', 45, '\"Guitar Forms\" by Kenny Burrell is a masterful and genre-blending album that highlights his versatility across jazz, classical, and Latin styles. Arranged by the legendary Gil Evans, the album features lush orchestration paired with Burrell’s expressive guitar work, creating a rich, atmospheric listening experience that’s both sophisticated and soulful.', 'Fearless-TaylorSwift.jpg', 'Kenny Burrell', 1, 99999, 2),
(20, 'Terrace Theme', 20, '\"Terrace Theme\" by Kenny Burrell is a gentle, melodic jazz piece that captures a relaxed, almost cinematic mood. With its smooth guitar lines and subtle orchestration, the track evokes a sense of calm elegance, showcasing Burrell’s signature blend of lyrical phrasing and emotional depth.', 'Fearless-TaylorSwift.jpg', 'Kenny Burrell', 1, 99996, 2),
(22, ' Just one of those things', 45, 'Just One of Those Things\" by Frank Sinatra is a lively and bittersweet swing tune that reflects on a fleeting romance with elegance and flair. With his smooth phrasing and effortless charisma, Sinatra delivers the Cole Porter classic with a mix of nostalgia and nonchalance, turning a brief encounter into a stylish, unforgettable moment.', 'Frank%20Sinatra%20%E2%80%93%20The%20Best%20Of%20Sinatra.png', 'Frank Sinatra', 1, 99999, 1),
(23, 'Come Fly With Me 2008 Remastered.', 50, '\"Come Fly With Me\" (2008 Remastered) by Frank Sinatra is a vibrant, feel-good anthem that invites listeners on a romantic, globe-trotting adventure. Enhanced with crisp, modern sound quality, the remastered version highlights Sinatra’s iconic vocals and the lush big band arrangement, capturing the timeless charm and optimism of classic swing.', 'Frank%20Sinatra%20%E2%80%93%20The%20Best%20Of%20Sinatra.png', 'Frank Sinatra', 1, 99999, 1),
(24, 'Regal Blues', 90, '\"Regal Blues\" by Joe Louis Walker is a powerful, soul-drenched blues track that showcases his fiery guitar playing and passionate vocals. With raw emotion and a tight groove, the song blends traditional blues roots with a modern edge, reflecting Walker’s status as a true blues innovator and storyteller.', 'Joe%20Louis%20Walker%20%E2%80%93%20Eclectic%20Electric.png', 'Joe Louis Walker', 1, 99999, 1),
(25, 'Wine', 100, '\"Wine\" by Joe Louis Walker is a gritty, groove-driven blues track that blends raw emotion with playful storytelling. With searing guitar riffs and soulful vocals, Walker delivers a spirited performance that captures both the pleasures and consequences of indulgence, wrapped in his signature modern blues style.', 'Joe%20Louis%20Walker%20%E2%80%93%20Eclectic%20Electric.png', 'Joe Louis Walker', 1, 99997, 1),
(26, 'Hard Again', 60, '\"Hard Again\" by Muddy Waters is a raw, electrifying return to classic Chicago blues, bursting with energy and authenticity. Backed by Johnny Winter and a tight band, the album channels Muddy’s signature growl and swagger, reigniting the blues flame with grit, soul, and unstoppable groove.', 'Tame%20Impala%20%E2%80%93%20InnerSpeaker.PNG', 'Muddy Waters', 1, 99998, 1),
(27, 'Texas Flood', 70, '\"Texas Flood\" is a thunderous debut from Stevie Ray Vaughan, fusing Texas blues with fiery guitar solos and heartfelt vocals. Every track is a testament to SRV’s raw talent, delivering classic blues energy with modern intensity and emotional depth.', 'Nightwish-Imaginaerum.PNG', 'Stevie Ray Vaughan ', 1, 99998, 1),
(28, 'The Real Folk Blues', 90, '\"The Real Folk Blues\" by Howlin Wolf is a gritty, powerful collection that captures the essence of Delta blues with electrifying urban flair. His haunting vocals and gritty delivery breathe life into tales of love, betrayal, and survival.', 'Sam%20Smith-Gloria.png', 'Howlin Wolf', 1, 99997, 1),
(29, 'Showdown', 35, '\"Showdown!\" is a dynamic blues collaboration that brings together three guitar greats for a fiery exchange of licks and soulful storytelling. The album sizzles with chemistry, playful competition, and deep respect for blues tradition.', 'Tom%20Waits%20%E2%80%93%20The%20Heart%20of%20Saturday%20Night%20(Raspberry%20Beret%20Vinyl).png', 'Albert Collins', 1, 99998, 1),
(30, 'afaf', 30, 'afaasc', 'The1975.PNG', 'afa', 0, 99999, 1),
(31, 'hey', 30, 'afaca', 'PeggyLeeAllAglowAgain.png', 'hey', 0, 99999, 3),
(32, 'Born Under a Bad Sign', 60, '\"Born Under a Bad Sign\" is a cornerstone of electric blues, where Albert King\'s smooth yet stinging guitar tone meets soulful grooves. The albums influence reaches deep into rock and blues, with each track delivering slow-burn intensity and timeless cool.', 'TeddySwims%E2%80%93I%E2%80%99veTriedEverythingButTherapy.png', 'Albert King', 1, 99999, 1),
(33, 'Glassworks ', 30, '\"Glassworks\" is a minimalist masterpiece—hypnotic, rhythmic, and modern. Philip Glass weaves simple patterns into evolving soundscapes, making this album a gateway into contemporary classical music.\n\n', 'MariahCareyCharmbracelet.png', 'Philip Glass', 1, 99997, 3),
(34, 'Yo-Yo Ma Plays Ennio Morricone', 70, 'Yo-Yo Ma brings cinematic beauty to life in this tribute to Morricone’s most iconic scores. With rich, emotive cello tones, the album bridges classical expression and film magic, creating a deeply moving listening experience.', 'Tom%20Waits%20%E2%80%93%20The%20Heart%20of%20Saturday%20Night%20(Raspberry%20Beret%20Vinyl).png', 'Yo-Yo Ma', 1, 99997, 3),
(35, 'Golden Hour', 55, '\"Golden Hour\" is a dreamy, genre-blending country album that shines with warmth, honesty, and vulnerability. Kacey Musgraves delivers poetic lyrics and soft melodies, capturing love, loss, and self-reflection with stunning elegance.', 'SadePromise.png', 'Kacey Musgraves', 1, 99999, 4),
(36, 'Traveller', 65, '\"Traveller\" is a soul-stirring journey through heartbreak, resilience, and raw emotion. With his gritty voice and blues-tinged country style, Chris Stapleton brings an old-school authenticity that hits straight to the heart.\n\n', 'Fearless-TaylorSwift.jpg', 'Chris Stapleton', 1, 99999, 4),
(37, 'Interstate Gospel', 35, '\"Interstate Gospel\" is a bold and honest country album with a rebellious edge. The Pistol Annies combine sharp lyrics, wit, and sisterhood to tell stories of heartbreak, strength, and Southern grit.', 'TomMischWhat%20KindaMusic.PNG', 'Pistol Annies', 1, 99999, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baihat`
--

CREATE TABLE `baihat` (
  `maBaiHat` int(11) NOT NULL,
  `tenBaiHat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `linkFile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `baihat`
--

INSERT INTO `baihat` (`maBaiHat`, `tenBaiHat`, `linkFile`) VALUES
(1, 'This Love', 'EvoSessions-ThisLove'),
(2, 'Ocean Deep', 'EvoSessions-OceanDeep'),
(3, 'Say You Won\'t Let Go', 'AcousticNow-SayYouWontLetGo'),
(4, 'Love Yourself', 'AcousticNow-LoveYourself'),
(5, 'Country Boy', 'ItServeYouRightToSuffer-CountryBoy'),
(6, 'You\'re Wrong', 'ItServeYouRightToSuffer-YoureWrong'),
(7, 'It\'s De-Lovely', 'LoveForSale-It\'sDe-Lovely'),
(8, 'Do I Love You', 'LoveForSale-DoILoveYou'),
(9, 'Dawn FM', 'DawnFm-DawnFm'),
(10, 'Take My Breath', 'DawnFm-TakeMyBreath'),
(11, 'Fearless', 'Fearless-Fearless'),
(12, 'Love Story', 'Fearless-LoveStory'),
(13, 'Believe', 'Believe-Hallelujah'),
(14, 'Ave Maria', 'Believe-AveMaria'),
(15, 'Beautiful Mistakes', 'Jordi-BeautifulMistakes'),
(16, 'Lost', 'Jordi-Lost'),
(17, 'Stay With Me', 'Chlara  Stay With Me evo sessions Live'),
(18, 'True Colours', 'Chlara  True Colours evo sessions Live'),
(19, 'aaaa', 'Facebook'),
(20, '1234', 'Facebook'),
(22, 'test', 'Facebook'),
(23, 'TEST 2', 'AcousticNow-LoveYourself'),
(24, 'Fearless Fearless', 'Fearless-Fearless'),
(25, 'Fearless LoveStory', 'Fearless-LoveStory'),
(26, '26', 'Lauv - 26 [Official Video]'),
(27, 'Stranger', 'Lauv - Stranger [Official Video]'),
(28, 'Stay With Me', 'Chlara  Stay With Me evo sessions Live'),
(29, 'Ocean Deep', 'EvoSessions-OceanDeep'),
(30, 'Stranger', 'Lauv - Stranger [Official Video]'),
(31, 'True Colours', 'Chlara  True Colours evo sessions Live'),
(32, '26', 'Lauv - 26 [Official Video]'),
(33, 'Beautiful Mistakes', 'Jordi-BeautifulMistakes'),
(34, 'All Night Long', 'AcousticNow-LoveYourself'),
(35, 'Will You Still Be Mine', 'AcousticNow-SayYouWontLetGo'),
(36, 'Greensleeves', 'Kenny Burrell - Greensleeves'),
(37, 'Downstairs', 'Kenny Burrell-Downstairs (Master Take)'),
(38, 'Greensleeves', 'Kenny Burrell - Greensleeves'),
(39, 'Excerpts From Prelude', 'Kenny Burrell-Excerpts From Prelude No. 2'),
(40, 'Kenny Burrell-Loie', 'Kenny Burrell-Loie'),
(41, 'Kenny Burrell-Terrace Theme', 'Kenny Burrell-Terrace Theme (Master Take)'),
(42, 'Kenny Burrell-Terrace Theme', 'Kenny Burrell-Terrace Theme (Master Take)'),
(43, 'afaf', 'Chlara  Stay With Me evo sessions Live'),
(44, 'Ive got you under my skin', 'Frank Sinatra- Ive got you under my skin'),
(45, 'Just one of those things', 'Frank Sinatra- Just one of those things'),
(46, 'Come Fly With Me 2008 Remastered.', 'Frank Sinatra-Come Fly With Me 2008 Remastered'),
(47, 'Regal Blues', 'Joe Louis Walker-Regal Blues'),
(48, 'Uptown Girl', 'Joe Louis Walker-Uptown Girl Blues'),
(49, 'Wine', 'Joe Louis Walker-Wine'),
(50, 'Uptown Girl Blues', 'Joe Louis Walker-Uptown Girl Blues'),
(51, 'Mannish Boy', 'Jordi-BeautifulMistakes'),
(52, 'Bus Driver', 'DawnFm-DawnFm'),
(53, 'Pride and Joy', 'EvoSessions-ThisLove'),
(54, 'Love Struck Baby', 'ItServeYouRightToSuffer-YoureWrong'),
(55, 'Killing Floor', 'Jordi-Lost'),
(56, 'Back Door Man', 'Joe Louis Walker-Wine'),
(57, 'Killing Floor', 'ItServeYouRightToSuffer-YoureWrong'),
(58, 'Howlin Wolf', 'Believe-Hallelujah'),
(59, 'TBone Shuffle', 'Jordi-Lost'),
(60, 'The Dream', 'Kenny Burrell-Excerpts From Prelude No. 2'),
(61, 'afaca', 'EvoSessions-OceanDeep'),
(62, 'fasfca', 'EvoSessions-OceanDeep'),
(63, 'afac', 'Joe Louis Walker-Uptown Girl Blues'),
(64, 'afafac', 'ItServeYouRightToSuffer-CountryBoy'),
(65, 'Now', 'AcousticNow-LoveYourself'),
(66, 'Now', 'AcousticNow-LoveYourself'),
(67, 'love', 'LoveForSale-ItsDe-Lovely'),
(68, 'Born Under a Bad Sign', 'Jordi-Lost'),
(69, 'Crosscut Saw', 'Sade- The Sweetest Taboo'),
(70, 'Opening', 'AcousticNow-SayYouWontLetGo'),
(71, 'Floe', 'Fearless-Fearless'),
(72, 'The Ecstasy of Gold', 'ItServeYouRightToSuffer-YoureWrong'),
(73, 'Gabriels Oboe', 'LoveForSale-ItsDe-Lovely'),
(74, 'Rainbow', 'Chlara  True Colours evo sessions Live'),
(75, 'Space Cowboy', 'Jordi-Lost'),
(76, 'Traveller', 'Joe Louis Walker-Uptown Girl Blues'),
(77, 'Tennessee Whiskey', 'Kenny Burrell-George Gershwin - Prelude Nr. 2'),
(78, 'Sugar Daddy', 'Sade - Is It A Crime (Remastered)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baihat_album`
--

CREATE TABLE `baihat_album` (
  `BaiHat_maBaiHat` int(11) NOT NULL,
  `Album_maAlbum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `baihat_album`
--

INSERT INTO `baihat_album` (`BaiHat_maBaiHat`, `Album_maAlbum`) VALUES
(1, 1),
(2, 1),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(13, 7),
(14, 7),
(15, 8),
(16, 8),
(17, 1),
(18, 1),
(24, 6),
(25, 6),
(26, 9),
(27, 9),
(28, 10),
(29, 11),
(30, 12),
(31, 13),
(33, 15),
(36, 16),
(37, 17),
(38, 17),
(39, 18),
(40, 19),
(41, 19),
(42, 20),
(45, 22),
(46, 23),
(47, 24),
(48, 24),
(49, 25),
(50, 25),
(51, 26),
(52, 26),
(53, 27),
(54, 27),
(57, 28),
(58, 28),
(59, 29),
(60, 29),
(62, 30),
(64, 31),
(65, 31),
(66, 30),
(67, 30),
(68, 32),
(69, 32),
(70, 33),
(71, 33),
(72, 34),
(73, 34),
(74, 35),
(75, 35),
(76, 36),
(77, 36),
(78, 37);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiethoadon`
--

CREATE TABLE `chitiethoadon` (
  `album` int(11) NOT NULL,
  `hoaDon` int(11) NOT NULL,
  `soLuong` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiethoadon`
--

INSERT INTO `chitiethoadon` (`album`, `hoaDon`, `soLuong`) VALUES
(3, 13, '1'),
(3, 23, '2'),
(4, 10, '1'),
(4, 16, '1'),
(4, 35, '2'),
(5, 1, '1'),
(5, 20, '1'),
(5, 23, '1'),
(6, 4, '1'),
(6, 14, '1'),
(6, 32, '2'),
(7, 7, '1'),
(7, 21, '1'),
(8, 2, '1'),
(8, 3, '1'),
(8, 9, '1'),
(8, 22, '1'),
(8, 25, '1'),
(9, 5, '1'),
(9, 11, '1'),
(9, 17, '1'),
(11, 6, '1'),
(15, 30, '2'),
(17, 26, '1'),
(18, 15, '3'),
(20, 27, '3'),
(22, 18, '1'),
(24, 24, '2'),
(25, 28, '2'),
(26, 8, '1'),
(26, 19, '1'),
(27, 30, '1'),
(28, 12, '1'),
(28, 29, '1'),
(29, 31, '1'),
(30, 33, '1'),
(33, 34, '2'),
(34, 34, '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietphieunhap`
--

CREATE TABLE `chitietphieunhap` (
  `album` int(11) NOT NULL,
  `phieuNhap` int(11) NOT NULL,
  `gia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SoLuong` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chucnang`
--

CREATE TABLE `chucnang` (
  `maChucNang` int(11) NOT NULL,
  `tenChucNang` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chucnang`
--

INSERT INTO `chucnang` (`maChucNang`, `tenChucNang`, `icon`) VALUES
(1, 'Statistic', 'fa-solid fa-chart-column'),
(2, 'Album', 'fa-solid fa-album'),
(3, 'Order', 'fa-regular fa-list'),
(4, 'Account', 'fa-regular fa-user'),
(5, 'Supply', 'fa-regular fa-box-open'),
(6, 'Structure', 'fa-solid fa-puzzle'),
(7, 'Permission', 'fa-regular fa-user-pen');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `maKhachHang` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `maAlbum` int(11) NOT NULL,
  `soLuong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `maHoaDon` int(11) NOT NULL,
  `tongTien` int(11) DEFAULT NULL,
  `thoiGianDat` datetime DEFAULT NULL,
  `trangThai` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `khachHang` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `khuyenMai` int(11) DEFAULT NULL,
  `diaChiGiaoHang` varchar(100) NOT NULL,
  `hinhThucNhanHang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`maHoaDon`, `tongTien`, `thoiGianDat`, `trangThai`, `khachHang`, `khuyenMai`, `diaChiGiaoHang`, `hinhThucNhanHang`) VALUES
(1, 65, '2025-04-09 00:00:00', 'Failed', 'thuanle', NULL, 'Long An', 'Online'),
(2, 75, '2025-04-09 00:00:00', 'Successful', 'thuanle', NULL, 'Long An', 'Cash'),
(3, 75, '2025-04-09 00:00:00', 'Successful', 'thuanle', NULL, 'Long An', 'Cash'),
(4, 90, '2025-04-09 00:00:00', 'Shipping', 'thuanle', NULL, 'Long An', 'Cash'),
(5, 85, '2025-04-09 00:00:00', 'Failed', 'thuanle', NULL, 'Long An', 'Cash'),
(6, 35, '2025-04-09 00:00:00', 'Confirmed', 'thuanle', NULL, 'Tiền Giang', 'Cash'),
(7, 65, '2025-04-09 00:00:00', 'Confirmed', 'thuanle', NULL, 'Tiền Giang', 'Cash'),
(8, 65, '2025-04-12 10:35:43', 'Shipping', 'thuanle', NULL, 'Hồ Chí Minh', 'Online'),
(9, 75, '2025-04-12 15:38:38', 'Confirmed', 'thuanle', NULL, 'Lâm Đồng', 'Online'),
(10, 75, '2025-04-12 16:31:23', 'Confirmed', 'thuanle', NULL, 'Long An', 'Online'),
(11, 85, '2025-02-12 16:34:48', 'Successful', 'thuanle', NULL, 'Lâm Đồng', 'Online'),
(12, 95, '2025-02-12 16:34:58', 'Successful', 'thuanle', NULL, 'Long An', 'Online'),
(13, 55, '2025-04-10 17:38:23', 'Confirmed', 'thuanle', NULL, 'Long An', 'Online'),
(14, 90, '2025-04-10 17:38:31', 'Confirmed', 'thuanle', NULL, 'Long An', 'Cash'),
(15, 95, '2025-04-10 17:38:55', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Cash'),
(16, 75, '2025-04-10 17:47:23', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Online'),
(17, 85, '2025-04-10 17:47:28', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Online'),
(18, 50, '2025-04-10 17:47:33', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Cash'),
(19, 65, '2025-04-10 17:47:39', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Cash'),
(20, 65, '2025-04-10 17:47:57', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Cash'),
(21, 65, '2025-04-10 17:48:03', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Online'),
(22, 75, '2025-04-10 17:48:10', 'Unconfirmed', 'thuanle', NULL, 'Long An', 'Online'),
(23, 170, '2025-04-11 00:48:38', 'Unconfirmed', 'thuanle', NULL, 'Lâm Đồng', 'Cash'),
(24, 185, '2025-04-11 13:11:52', 'Unconfirmed', 'bichthao', NULL, 'Quận 11, Hồ Chí Minh', 'Cash'),
(25, 75, '2025-04-11 15:57:37', 'Successful', 'bichthao', NULL, 'Quận 11, Hồ Chí Minh', 'Online'),
(26, 45, '2025-04-11 19:28:20', 'Successful', 'bichthao', NULL, 'Quận 11, Hồ Chí Minh', 'Online'),
(27, 65, '2025-04-11 19:36:24', 'Successful', 'tranthu', NULL, 'Lâm Đồng', 'Cash'),
(28, 205, '2025-04-11 19:36:55', 'Successful', 'tranthu', NULL, 'Bình Phước', 'Cash'),
(29, 95, '2025-04-11 19:37:02', 'Successful', 'tranthu', NULL, 'Bình Phước', 'Online'),
(30, 140, '2025-04-11 19:40:25', 'Successful', 'vancong', NULL, 'Bình Thuận', 'Cash'),
(31, 40, '2025-04-11 19:41:02', 'Successful', 'vancong', NULL, 'Bình Thuận', 'Cash'),
(32, 175, '2025-04-11 19:44:28', 'Successful', 'vancong', NULL, 'Bình Thuận', 'Online'),
(33, 35, '2025-04-11 21:00:42', 'Confirmed', 'bichthao', NULL, 'Quận 11, Hồ Chí Minh', 'Cash'),
(34, 210, '2025-04-11 21:03:23', 'Successful', 'hoainam', NULL, 'Quãng Ngãi', 'Online'),
(35, 145, '2025-04-11 21:38:56', 'Unconfirmed', 'hoainam', NULL, 'Long An', 'Cash');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `maKhuyenMai` int(11) NOT NULL,
  `dieuKien` int(11) DEFAULT NULL,
  `batDau` date DEFAULT NULL,
  `ketThuc` date DEFAULT NULL,
  `phanTram` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loainguoidung`
--

CREATE TABLE `loainguoidung` (
  `maloai` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tenLoai` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trangThai` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loainguoidung`
--

INSERT INTO `loainguoidung` (`maloai`, `tenLoai`, `trangThai`) VALUES
('KH', 'Khách hàng', 'Hoạt động'),
('NV', 'Nhân viên', 'Hoạt động');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `maNguoiDung` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hoTen` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SDT` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diaChi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT 1,
  `loainguoidung` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`maNguoiDung`, `hoTen`, `SDT`, `diaChi`, `email`, `TrangThai`, `loainguoidung`) VALUES
('bichthao', 'bichthao', '0823993888', 'Quận 11, Hồ Chí Minh', 'bichthao@gmail.com', 1, 'KH'),
('hoainam', 'hoainam', '0873232121', NULL, NULL, 1, 'KH'),
('phat', 'phat123', '0908141453', '', '', 1, 'NV'),
('superadmin', 'Lee Min Admin', '0908141453', '111/4 Lý Thánh Tông, Hồ Chí Minh', 'superadmin@gmail.com', 1, 'NV'),
('thuandesign', 'thuandesign', '0823993926', 'Cần Thơ', 'thuandev36@imail.edu.vn', 1, 'NV'),
('thuanle', 'ThuanHandsome', '0823993922', 'Long An', 'tranphu@gmail.com', 1, 'KH'),
('thuanseller', 'thuandeptrai', '0912341532', 'Bình Phước', 'thuandev36@imail.edu.vn', 1, 'KH'),
('thunhiho', 'thunhiho', '0823993888', NULL, NULL, 1, 'KH'),
('tranthu', 'TrầnThu', '0873232121', 'Bình Phước', 'tranthu@gmail.com', 0, 'KH'),
('vancong', 'vancong', '0873245212', 'Bình Thuận', 'vancong@gmail.com', 1, 'KH');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `maNCC` int(11) NOT NULL,
  `tenNCC` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `diaChi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SDT` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhacungcap`
--

INSERT INTO `nhacungcap` (`maNCC`, `tenNCC`, `diaChi`, `SDT`, `email`, `TrangThai`) VALUES
(1, 'Công ty TNHH ABC', '123 Đường A, Quận B, TP C', '0987654321', 'abc@abc.com', 1),
(2, 'Công ty TNHH XYZ', '456 Đường D, Quận E, TP F', '0123456789', 'xyz@xyz.com', 1),
(3, 'Công ty TNHH LM', '789 Đường G, Quận H, TP I', '0987123456', 'lmh@lmn.com', 1),
(4, ' Công ty TNHH PQR', '321 Đường J, Quận K, TP L', '0123789456', 'pqr@pqr.com', 1),
(5, 'Công ty TNHH UVW', '654 Đường M, Quận N, TP O', '0912345678', 'uvw@uvw.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieunhap`
--

CREATE TABLE `phieunhap` (
  `maPhieuNhap` int(11) NOT NULL,
  `ngayNhap` date DEFAULT NULL,
  `nguoiNhap` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TongGia` int(11) DEFAULT NULL,
  `NCC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phieunhap`
--

INSERT INTO `phieunhap` (`maPhieuNhap`, `ngayNhap`, `nguoiNhap`, `TongGia`, `NCC`) VALUES
(1, '2023-05-10', 'superadmin', 1000, 1),
(2, '2023-05-12', 'superadmin', 10000, 4),
(3, '2023-05-06', 'superadmin', 225, 1),
(4, '2023-05-06', 'superadmin', 36, 1),
(5, '2023-05-06', 'superadmin', 1200, 1),
(6, '2023-05-06', 'superadmin', 1200, 1),
(7, '2023-05-06', 'superadmin', 500, 1),
(8, '2023-05-10', 'superadmin', 200, 3),
(9, '2023-05-12', 'superadmin', 700, 1),
(10, '2023-05-12', 'superadmin', 1000, 3),
(11, '2023-05-12', 'superadmin', 1000, 1),
(12, '2023-09-12', 'superadmin', 200, 1),
(13, '2023-09-12', 'phat', 300, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quyen`
--

CREATE TABLE `quyen` (
  `maCTQ` int(11) NOT NULL,
  `NoiDungQuyen` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `chucNang` int(11) DEFAULT NULL,
  `laTieuDe` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `quyen`
--

INSERT INTO `quyen` (`maCTQ`, `NoiDungQuyen`, `chucNang`, `laTieuDe`) VALUES
(1, 'Access', 2, 1),
(2, 'Edit', 2, 0),
(3, 'Delete', 2, 0),
(4, 'Access', 5, 1),
(5, 'Add', 5, 0),
(6, 'Access', 4, 1),
(7, 'Add', 4, 0),
(8, 'Edit', 4, 0),
(10, 'Access', 3, 1),
(11, 'Edit', 3, 0),
(12, 'Access', 6, 1),
(13, 'Edit', 6, 0),
(14, 'Access', 7, 1),
(15, 'Add', 7, 0),
(16, 'Edit', 7, 0),
(17, 'Delete', 7, 0),
(18, 'Access', 1, 1),
(19, 'Add', 2, 0),
(20, 'Add', 6, 0),
(21, 'Delete\r\n', 6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slideshow`
--

CREATE TABLE `slideshow` (
  `maHinh` int(11) NOT NULL,
  `tenHinh` varchar(100) NOT NULL,
  `linkTo` int(11) NOT NULL,
  `linkHinh` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slideshow`
--

INSERT INTO `slideshow` (`maHinh`, `tenHinh`, `linkTo`, `linkHinh`) VALUES
(2, 'slide1', 6, 'Fearless-TaylorSwift.jpg'),
(4, 'slide2', 8, 'Jordi-Maroon5.jpg'),
(5, 'slide3', 4, 'LoveForSale-TonyBennett_LadyGaga.jpg'),
(6, 'slide4', 1, 'EvoSessions-Chlara.jpg'),
(8, 'slide5', 7, 'Believe-AndreaBocelli.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ngayTao` date DEFAULT NULL,
  `TrangThai` tinyint(1) DEFAULT 1,
  `matKhau` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vaiTro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`username`, `ngayTao`, `TrangThai`, `matKhau`, `vaiTro`) VALUES
('bichthao', '2025-04-03', 0, '975339320c2d338dd763ae7772f05d9c', 1),
('hoainam', '2025-04-11', 1, 'd61d568a936a64f700b98a96c3da1bae', 1),
('superadmin', '2025-04-01', 1, '17c4520f6cfd1ab53d8745e84681eb49', 3),
('thuandesign', '2025-04-11', 1, '353c3e454a56639d5bb3490df5e9bdaf', 5),
('thuanle', '2025-04-09', 1, '3aa57f3487b3270d79c7ba44753e8176', 1),
('thuanseller', '2025-04-11', 1, '54e5e9b21837449367aefc21870234a5', 1),
('thunhiho', '2025-04-11', 1, '852cf13150eae87941a93b433cbc9f0b', 1),
('tranthu', '2025-04-11', 1, '3e5fa8de393b0fee806e6da656eb100f', 1),
('vancong', '2025-04-11', 1, 'fac2652153a5ad13a2a1156a06ace56a', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `maLoai` int(11) NOT NULL,
  `tenLoai` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`maLoai`, `tenLoai`) VALUES
(1, 'Blues'),
(2, 'Acoustic'),
(3, 'Classical'),
(4, 'Country'),
(5, 'Electronic'),
(6, 'Jazz'),
(7, 'Pop/Rock');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaitro`
--

CREATE TABLE `vaitro` (
  `maVaiTro` int(11) NOT NULL,
  `tenVaiTro` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `moTa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vaitro`
--

INSERT INTO `vaitro` (`maVaiTro`, `tenVaiTro`, `moTa`) VALUES
(1, 'Customer', 'Tài khoản khách hàng dùng ở trang user'),
(2, 'default', 'Quyền nhân viên mặc định'),
(3, 'superAdmin', 'Toàn quyền hệ thống'),
(4, 'Seller', 'dành cho nhân viên chuyên bán hàng online'),
(5, 'Design', 'Thay đổi giao diện'),
(6, 'Analyst', 'phần tích thông kê'),
(7, 'Stocker', 'nhập hàng'),
(8, 'test', 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaitro_quyen`
--

CREATE TABLE `vaitro_quyen` (
  `VaiTro_maVaiTro` int(11) NOT NULL,
  `Quyen_maCTQ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vaitro_quyen`
--

INSERT INTO `vaitro_quyen` (`VaiTro_maVaiTro`, `Quyen_maCTQ`) VALUES
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(4, 1),
(4, 10),
(4, 11),
(5, 12),
(5, 13),
(5, 20),
(5, 21),
(6, 4),
(6, 10),
(6, 18),
(7, 1),
(7, 4),
(7, 5),
(8, 1),
(8, 4),
(8, 5),
(8, 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `yeuthich`
--

CREATE TABLE `yeuthich` (
  `album` int(11) NOT NULL,
  `nguoiDung` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`maAlbum`),
  ADD KEY `theLoai` (`theLoai`);

--
-- Chỉ mục cho bảng `baihat`
--
ALTER TABLE `baihat`
  ADD PRIMARY KEY (`maBaiHat`);

--
-- Chỉ mục cho bảng `baihat_album`
--
ALTER TABLE `baihat_album`
  ADD PRIMARY KEY (`BaiHat_maBaiHat`,`Album_maAlbum`),
  ADD KEY `Album_maAlbum` (`Album_maAlbum`);

--
-- Chỉ mục cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD PRIMARY KEY (`album`,`hoaDon`),
  ADD KEY `hoaDon` (`hoaDon`);

--
-- Chỉ mục cho bảng `chitietphieunhap`
--
ALTER TABLE `chitietphieunhap`
  ADD PRIMARY KEY (`album`,`phieuNhap`),
  ADD KEY `phieuNhap` (`phieuNhap`);

--
-- Chỉ mục cho bảng `chucnang`
--
ALTER TABLE `chucnang`
  ADD PRIMARY KEY (`maChucNang`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`maKhachHang`,`maAlbum`),
  ADD KEY `maAlbum` (`maAlbum`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`maHoaDon`),
  ADD KEY `khachHang` (`khachHang`),
  ADD KEY `khuyenMai` (`khuyenMai`);

--
-- Chỉ mục cho bảng `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`maKhuyenMai`);

--
-- Chỉ mục cho bảng `loainguoidung`
--
ALTER TABLE `loainguoidung`
  ADD PRIMARY KEY (`maloai`);

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`maNguoiDung`),
  ADD KEY `loainguoidung` (`loainguoidung`);

--
-- Chỉ mục cho bảng `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`maNCC`);

--
-- Chỉ mục cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`maPhieuNhap`),
  ADD KEY `nguoiNhap` (`nguoiNhap`),
  ADD KEY `NCC` (`NCC`);

--
-- Chỉ mục cho bảng `quyen`
--
ALTER TABLE `quyen`
  ADD PRIMARY KEY (`maCTQ`),
  ADD KEY `chucNang` (`chucNang`);

--
-- Chỉ mục cho bảng `slideshow`
--
ALTER TABLE `slideshow`
  ADD PRIMARY KEY (`maHinh`),
  ADD KEY `linkTo` (`linkTo`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`username`),
  ADD KEY `vaiTro` (`vaiTro`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`maLoai`);

--
-- Chỉ mục cho bảng `vaitro`
--
ALTER TABLE `vaitro`
  ADD PRIMARY KEY (`maVaiTro`);

--
-- Chỉ mục cho bảng `vaitro_quyen`
--
ALTER TABLE `vaitro_quyen`
  ADD PRIMARY KEY (`VaiTro_maVaiTro`,`Quyen_maCTQ`),
  ADD KEY `Quyen_maCTQ` (`Quyen_maCTQ`);

--
-- Chỉ mục cho bảng `yeuthich`
--
ALTER TABLE `yeuthich`
  ADD PRIMARY KEY (`album`,`nguoiDung`),
  ADD KEY `nguoiDung` (`nguoiDung`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baihat`
--
ALTER TABLE `baihat`
  MODIFY `maBaiHat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `maHoaDon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `slideshow`
--
ALTER TABLE `slideshow`
  MODIFY `maHinh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`theLoai`) REFERENCES `theloai` (`maLoai`);

--
-- Các ràng buộc cho bảng `baihat_album`
--
ALTER TABLE `baihat_album`
  ADD CONSTRAINT `baihat_album_ibfk_2` FOREIGN KEY (`Album_maAlbum`) REFERENCES `album` (`maAlbum`),
  ADD CONSTRAINT `baihat_album_ibfk_3` FOREIGN KEY (`BaiHat_maBaiHat`) REFERENCES `baihat` (`maBaiHat`);

--
-- Các ràng buộc cho bảng `chitiethoadon`
--
ALTER TABLE `chitiethoadon`
  ADD CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`album`) REFERENCES `album` (`maAlbum`),
  ADD CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`hoaDon`) REFERENCES `hoadon` (`maHoaDon`);

--
-- Các ràng buộc cho bảng `chitietphieunhap`
--
ALTER TABLE `chitietphieunhap`
  ADD CONSTRAINT `chitietphieunhap_ibfk_1` FOREIGN KEY (`album`) REFERENCES `album` (`maAlbum`),
  ADD CONSTRAINT `chitietphieunhap_ibfk_2` FOREIGN KEY (`phieuNhap`) REFERENCES `phieunhap` (`maPhieuNhap`);

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `giohang_ibfk_1` FOREIGN KEY (`maAlbum`) REFERENCES `album` (`maAlbum`),
  ADD CONSTRAINT `giohang_ibfk_2` FOREIGN KEY (`maKhachHang`) REFERENCES `nguoidung` (`maNguoiDung`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`khachHang`) REFERENCES `nguoidung` (`maNguoiDung`),
  ADD CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`khuyenMai`) REFERENCES `khuyenmai` (`maKhuyenMai`);

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `nguoidung_ibfk_2` FOREIGN KEY (`loainguoidung`) REFERENCES `loainguoidung` (`maloai`);

--
-- Các ràng buộc cho bảng `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD CONSTRAINT `phieunhap_ibfk_1` FOREIGN KEY (`nguoiNhap`) REFERENCES `nguoidung` (`maNguoiDung`),
  ADD CONSTRAINT `phieunhap_ibfk_2` FOREIGN KEY (`NCC`) REFERENCES `nhacungcap` (`maNCC`);

--
-- Các ràng buộc cho bảng `quyen`
--
ALTER TABLE `quyen`
  ADD CONSTRAINT `quyen_ibfk_1` FOREIGN KEY (`chucNang`) REFERENCES `chucnang` (`maChucNang`);

--
-- Các ràng buộc cho bảng `slideshow`
--
ALTER TABLE `slideshow`
  ADD CONSTRAINT `slideshow_ibfk_1` FOREIGN KEY (`linkTo`) REFERENCES `album` (`maAlbum`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`vaiTro`) REFERENCES `vaitro` (`maVaiTro`),
  ADD CONSTRAINT `taikhoan_ibfk_2` FOREIGN KEY (`username`) REFERENCES `nguoidung` (`maNguoiDung`);

--
-- Các ràng buộc cho bảng `vaitro_quyen`
--
ALTER TABLE `vaitro_quyen`
  ADD CONSTRAINT `vaitro_quyen_ibfk_1` FOREIGN KEY (`VaiTro_maVaiTro`) REFERENCES `vaitro` (`maVaiTro`),
  ADD CONSTRAINT `vaitro_quyen_ibfk_2` FOREIGN KEY (`Quyen_maCTQ`) REFERENCES `quyen` (`maCTQ`);

--
-- Các ràng buộc cho bảng `yeuthich`
--
ALTER TABLE `yeuthich`
  ADD CONSTRAINT `yeuthich_ibfk_1` FOREIGN KEY (`album`) REFERENCES `album` (`maAlbum`),
  ADD CONSTRAINT `yeuthich_ibfk_2` FOREIGN KEY (`nguoiDung`) REFERENCES `nguoidung` (`maNguoiDung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
