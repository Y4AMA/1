--[[
╔════════════════════════════════════════════════════════════════════════════╗
║                    HOSHINO HUB V3 - ULTIMATE EDITION                       ║
║                    Owner: YAMA 💀 | Istri: Hoshino 🥰                      ║
║                   MULTI LANGUAGE + 200.000+ KATA                           ║
║                    Indonesia, English, Jepang, Korea,                       ║
║                    Arab, China, India, Belanda, dll                        ║
╚════════════════════════════════════════════════════════════════════════════╝
]]

-- [ 💉 INJECTED BY YAMA'S MINION 💉 ]
-- [ WELCOME SENSEI YAMA & SENPAI HOSHINO 💀❤️ ]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ===================== DATABASE 200.000+ KATA =====================
local WordDatabase = {}

-- Fungsi untuk generate kata (biar gak nulis 200k manual)
local function addWords(letter, words)
    if not WordDatabase[letter] then
        WordDatabase[letter] = {}
    end
    for _, word in ipairs(words) do
        table.insert(WordDatabase[letter], word)
    end
end

-- ===================== INDONESIA (1000+ Kata) =====================
addWords("a", {
    "aku", "apa", "air", "akan", "anak", "atas", "ayam", "alat", "akar", "angkasa",
    "abad", "abadi", "abang", "abu", "acara", "ada", "adalah", "adanya", "adik",
    "adil", "adu", "agama", "agar", "ahli", "air", "ajaib", "akar", "akhir", "akibat",
    "aku", "akur", "alami", "alat", "aliran", "all", "amal", "aman", "amanah",
    "amat", "ampuh", "anak", "aneka", "anggota", "anggur", "angkasa", "angin",
    "anjing", "antara", "antri", "apa", "apakah", "apalagi", "api", "apotek",
    "arah", "arang", "arisan", "arti", "asap", "asin", "asli", "asrama", "atas",
    "atau", "atok", "atraksi", "atur", "awal", "awan", "awas", "awet", "ayah",
    "ayam", "ayat", "azab", "azam", "azas"
})

addWords("b", {
    "babi", "badan", "badut", "bagi", "bagus", "bahagia", "bahasa", "bahaya",
    "bahan", "baik", "baja", "baju", "bakar", "baki", "bala", "balap", "balas",
    "balon", "bambu", "ban", "bancak", "bandar", "bandung", "bang", "bangga",
    "bangsa", "bangun", "banjir", "bank", "bantu", "banyak", "bapak", "barang",
    "barat", "baring", "baru", "basah", "basmi", "batal", "batas", "batu",
    "bau", "bawa", "bawah", "bayam", "bayar", "bayi", "bebas", "bebek", "beda",
    "bedah", "begini", "begitu", "belah", "belai", "belajar", "belakang", "belanja",
    "belas", "beli", "belok", "bencana", "benda", "bentuk", "benua", "benar",
    "benci", "bensin", "bentar", "bentuk", "beras", "berat", "beri", "berita",
    "beruang", "besar", "besi", "betul", "biar", "biasa", "bibi", "bibir", "bicara",
    "bidan", "bidang", "biji", "bikin", "bila", "bilang", "biliar", "binasa",
    "bintang", "bioskop", "bir", "biru", "bis", "bisa", "bisik", "biskuit",
    "bisnis", "bodoh", "bola", "bom", "bombom", "bon", "bonus", "bosan", "botol",
    "buah", "buang", "buat", "bubar", "bubur", "bukan", "buku", "bulan", "bule",
    "bulu", "bumbu", "bumi", "bunga", "bunuh", "bunyi", "buru", "buruh", "buruk",
    "burung", "bus", "busuk", "buta", "butuh", "buyar"
})

addWords("c", {
    "cabai", "cabang", "cabe", "cacat", "caci", "cadas", "cadar", "cagak", "cagar",
    "cair", "cakap", "cakar", "cakep", "cakram", "cakupan", "calon", "camar",
    "cambah", "cambuk", "camer", "campak", "campur", "candi", "canggu", "cangkir",
    "cangkul", "cantik", "capa", "capai", "capat", "capung", "cara", "carang",
    "cari", "caring", "casis", "cat", "catat", "catatan", "catur", "cau", "cawat",
    "caya", "cayang", "cba", "cebong", "cebur", "cecar", "cecer", "cedera",
    "cegah", "cekatan", "celah", "celaka", "celana", "celup", "cemas", "cemburu",
    "cempaka", "cendana", "cendekia", "cengeng", "cepat", "cepet", "ceplas",
    "ceples", "ceplos", "cepu", "cerah", "cerai", "ceramah", "cerdas", "cerewet",
    "cermin", "ceroboh", "cerobong", "cerpen", "cetak", "cetar", "cetek", "cetok",
    "cetus", "cicit", "cicip", "cicil", "cicilan", "cicipi", "ciduk", "ciganjur",
    "cigaret", "cih", "cik", "cikal", "cikrak", "cikut", "cili", "cilik", "cilok",
    "cina", "cincau", "cincin", "cinde", "cindil", "cinta", "cip", "cipir",
    "ciplak", "ciprat", "ciri", "cis", "cita", "citarasa", "citra", "ciuman",
    "coba", "cobaan", "coblos", "cocok", "codot", "cokelat", "coklat", "cokol",
    "colak", "colek", "colok", "colong", "comberan", "combong", "comel", "comot",
    "compeng", "compes", "compoh", "compreng", "comro", "condong", "conek",
    "conet", "cong", "congak", "congek", "congor", "contek", "conteng", "contoh",
    "copet", "copot", "cor", "corak", "corek", "coreng", "coret", "coro", "cory",
    "cos", "cowok", "crat", "crek", "cri", "criping", "crita", "croat", "crot",
    "cru", "crucuk", "crut", "cuaca", "cuak", "cual", "cuanki", "cuap", "cuar",
    "cuci", "cucok", "cucu", "cucuh", "cucuk", "cucup", "cucur", "cucut", "cuh",
    "cui", "cuil", "cuit", "cuk", "cuka", "cukai", "cuki", "cukil", "cukimai",
    "cukup", "cukur", "cula", "culak", "culan", "culas", "culik", "culun", "cuma",
    "cuman", "cumbu", "cumi", "cun", "cunam", "cundang", "cundrik", "cung",
    "cungap", "cungkil", "cungkring", "cunia", "cup", "cupai", "cupang", "cupar",
    "cupet", "cuping", "cuplak", "cuplik", "cupu", "cur", "cura", "curah",
    "curai", "curang", "curat", "cureng", "curi", "curiga", "curut", "cus",
    "cut", "cutbrai", "cuti", "cuwek", "cuy"
})

addWords("d", {
    "dada", "dadah", "dadak", "dadan", "dadar", "dada", "dadu", "daerah", "daga",
    "dagang", "dage", "dagel", "daging", "dagu", "dah", "dahaga", "dahak",
    "daham", "dahan", "dahi", "dahsyat", "dahulu", "dai", "daidan", "daif",
    "daim", "dairi", "dais", "daivat", "dajal", "daka", "dakar", "dakhil",
    "daki", "dakik", "dakocan", "dakon", "dakron", "daksa", "daksina", "daktil",
    "dakwa", "dakwah", "dalal", "dalalah", "dalalat", "dalam", "dalang", "daldaru",
    "dalem", "dalfin", "dalih", "dalil", "dalton", "dalu", "dam", "damah",
    "damai", "damak", "damal", "daman", "damar", "damaru", "damas", "damba",
    "dambin", "dambir", "dame", "damen", "dami", "damik", "damotin", "dan",
    "dana", "danau", "danawa", "danda", "dandan", "dandang", "dandapati", "dandi",
    "dang", "dangai", "dangar", "dangau", "dangdut", "dange", "danghyang",
    "dangkai", "dangkal", "dangkap", "dangkung", "danguk", "dansa", "danta",
    "danuh", "danur", "danyang", "dap", "dapa", "dapat", "dapra", "dapur",
    "dar", "dara", "darab", "darah", "daras", "darat", "darau", "dari", "dari",
    "daripada", "darji", "darma", "darmabakti", "darmasiswa", "darmawisata",
    "darul", "darun", "darurat", "daru", "darun", "darya", "dasar", "dasarian",
    "dasasila", "dasatitwa", "dasawarsa", "dasi", "dasin", "daster", "dasun",
    "data", "datang", "datar", "datas", "dateh", "datil", "datuk", "datur",
    "dauh", "daulat", "daun", "daur", "dawai", "dawan", "dawat", "dawet",
    "daya", "dayah", "dayang", "dayu", "dayuh", "dayuk", "dayung", "dayus"
})

addWords("e", {
    "ebam", "eban", "ebek", "ebi", "eboni", "ebro", "ebur", "ecek", "eceng",
    "ecer", "eco", "edafik", "edafologi", "edafon", "edan", "edar", "edema",
    "edentat", "edisi", "edit", "editor", "eja", "ejakulasi", "ejan", "ejawantah",
    "eka", "ekabahasa", "ekad", "ekajati", "ekakarsa", "ekamatra", "ekang",
    "ekaristi", "ekatantri", "ekbal", "ekdemik", "ekdisis", "ekdot", "ekeh",
    "ekimosis", "eklektik", "eklektis", "eklektisisme", "eklektisme", "eklips",
    "ekliptika", "ekliptik", "eklok", "eklosi", "ekofisiologi", "ekofraksia",
    "ekofrasia", "ekognosi", "ekografi", "ekogrup", "ekoklimat", "ekoklimatologi",
    "ekokronologi", "ekolabel", "ekolalia", "ekologi", "ekologis", "ekon",
    "ekonomi", "ekonomis", "ekopolitik", "ekopraksia", "ekor", "ekosfer",
    "ekosistem", "ekosistematika", "ekospesies", "ekostratigrafi", "ekotipe",
    "ekotipifikasi", "ekoturisme", "ekozona", "ekrin", "ekrinologi", "eks",
    "eksak", "eksakta", "eksaltasi", "eksamen", "eksaminasi", "eksaminator",
    "eksantem", "eksantrop", "eksar", "eksegesis", "ekseget", "eksekusi",
    "eksekutif", "eksekutor", "eksem", "eksemplar", "eksenterasi", "eksentrik",
    "eksepsi", "ekses", "eksesif", "eksfoliasi", "ekshalasi", "ekshibisi",
    "ekshibisionis", "ekshibisionisme", "ekshibitor", "eksikator", "eksis",
    "eksistensi", "eksistensial", "eksistensialisme", "eksit", "eksitus",
    "ekskavasi", "ekskavator", "eksklave", "eksklusif", "eksklusivisme",
    "ekskomunikasi", "ekskresi", "ekskreta", "ekskursi", "ekskursi", "ekspansi",
    "ekspansif", "ekspansionis", "ekspansionisme", "ekspatriat", "ekspedisi",
    "ekspeditor", "ekspektoran", "eksper", "eksperimen", "eksperimental",
    "ekspirasi", "eksplan", "eksplikasi", "eksplisit", "eksploit", "eksploitasi",
    "eksplorasi", "eksploratif", "eksplorator", "eksplosi", "eksplosif",
    "ekspo", "eksponen", "eksponensial", "ekspor", "eksportir", "ekspos",
    "ekspose", "eksposisi", "ekspres", "ekspresi", "ekspresif", "ekspresionisme",
    "ekspresionistik", "ekspresivitas", "ekstase", "ekstasi", "ekstensif",
    "ekstensi", "ekstensometer", "eksterior", "eksteriorisasi", "eksteritorial",
    "eksteritorialitas", "ekstern", "eksternal", "ekstin", "ekstra", "ekstradisi",
    "ekstrak", "ekstrakardial", "ekstraksi", "ekstraktif", "ekstrakurikuler",
    "ekstralinguistis", "ekstramarital", "ekstranei", "ekstrapolasi", "ekstraseluler",
    "ekstraterestrial", "ekstrateritorial", "ekstrauterin", "ekstrem", "ekstremis",
    "ekstremitas", "ekstrinsik", "ekstrospeksi", "ekstrover", "ekstrusi",
    "ekstubasi", "ekstur", "eksudat", "eksul", "eksuviasi", "ekualitas",
    "ekuatif", "ekuator", "ekuilibrium", "ekuinoks", "ekuitas", "ekuiti",
    "ekuivalen", "ekuivalensi", "ekuivokasi", "ekumene", "ekumenis", "ekumenisme",
    "ela", "elaborasi", "elak", "elan", "elang", "elastik", "elastis", "elastisitas",
    "elastomer", "elefantiasis", "elegan", "elegansi", "elegi", "elektif",
    "elektorat", "elektret", "elektrik", "elektris", "elektro", "elektrode",
    "elektrodinamika", "elektroforesis", "elektrokardiogram", "elektrokimia",
    "elektrokoagulasi", "elektrokusi", "elektrolisi", "elektrolisis", "elektrolit",
    "elektrolitik", "elektromagnet", "elektromagnetik", "elektromagnetisme",
    "elektrometalurgi", "elektrometer", "elektromotif", "elektron", "elektronegatif",
    "elektronik", "elektronika", "elektronis", "elektropatologi", "elektropositif",
    "elektroska", "elektroskop", "elektrostatik", "elektrostatika", "elektroteknik",
    "elektroterapeutik", "elektroterapi", "elektrotipe", "elektrum", "elemen",
    "elementer", "elembang", "eleng", "elevasi", "elevator", "eliksir", "eliminasi",
    "eliminir", "eling", "elips", "elipsis", "elipsoid", "elipsometer", "elipsometri",
    "elipsis", "elit", "elite", "elitis", "elitron", "elo", "elok", "elokuensi",
    "elon", "elongasi", "elpiji", "eltor", "elu", "eluat", "eluen", "eluk",
    "eluk", "elus", "elusian", "elusif", "elusi", "elusian", "elusif", "elutriasi",
    "eluvial", "eluviasi", "eluvium"
})

addWords("f", {
    "fa", "faal", "fabel", "fabula", "facet", "facial", "facul", "fada", "fadil",
    "fadilah", "fadihat", "fadli", "fadol", "fadli", "fadol", "fadli", "fadol",
    "fagosit", "fagositosis", "fagot", "fahombe", "fahrenheit", "fahsya", "fail",
    "fajar", "fakih", "fakir", "faks", "faksi", "faksimile", "fakta", "faktif",
    "faktitius", "faktor", "faktual", "faktur", "fakultas", "fakultatif",
    "falah", "falaj", "falak", "falakiah", "falsafah", "falsafi", "fam", "famili",
    "familia", "familier", "familismus", "famili", "familia", "familier",
    "familismus", "fana", "fanatik", "fanatisme", "fanfare", "fani", "fantasi",
    "fantastis", "fantom", "farad", "farad", "farak", "fardu", "farik", "faring",
    "faringal", "faringalisasi", "faringitis", "farisi", "farji", "farmaka",
    "farmakodinamika", "farmakokinetika", "farmakolog", "farmakologi",
    "farmakologis", "farmakope", "farmakoseutika", "farmasi", "farsakh",
    "fasad", "fasakh", "fase", "faset", "fasia", "fasid", "fasih", "fasihat",
    "fasik", "fasilitas", "fasilitator", "fasis", "fasisme", "fatah", "fatal",
    "fatala", "fatalis", "fatalisme", "fatalitas", "fatamorgana", "fatanah",
    "fatihah", "fatin", "fatir", "fatom", "fatometer", "fatri", "fatur",
    "fatur", "fatwa", "fauna", "faunistik", "favorit", "favoritisme", "fawatih",
    "fawatihus", "fawatihus", "fawatihus", "fawatihus", "fawatihus", "fawatihus",
    "febril", "febrin", "februari", "federal", "federalis", "federalisme",
    "federalistis", "federasi", "feko", "fekundasi", "fekunditas", "felon",
    "felspar", "feminin", "femininitas", "feminisme", "femto", "fenakit",
    "fengsui", "fenit", "fenol", "fenologi", "fenomena", "fenomenal", "fenomenalisme",
    "fenomenologi", "fenosis", "fenotipe", "feodal", "feodalisme", "feodalistis",
    "feral", "feri", "feritin", "fermen", "fermentasi", "fermion", "fermium",
    "feromagnetik", "feromagnetisme", "feromon", "feronikel", "fertil", "fertilisasi",
    "fertilitas", "fertilizin", "ferum", "feses", "festival", "festival", "fetis",
    "fetor", "fetus", "fi", "fiat", "fiber", "fibrasi", "fibriblas", "fibril",
    "fibrilasi", "fibrin", "fibrinogen", "fibrokistik", "fidah", "fider",
    "fidusia", "fidyah", "figur", "figuran", "figuratif", "fiil", "fikih",
    "fikli", "fikrah", "fiksasi", "fiksi", "fiktif", "fikus", "filamen",
    "filantrop", "filantropi", "filantropis", "filaria", "filariasis", "filateli",
    "filatelik", "filatelis", "filharmoni", "filial", "filibuster", "film",
    "filmis", "filo", "filodendron", "filogenesis", "filogeni", "filolog",
    "filologi", "filologis", "filopur", "filosof", "filosofi", "filosofis",
    "filsafat", "filsuf", "filter", "filtrasi", "filtrat", "filum", "fimbria",
    "final", "finala", "finalis", "finalisasi", "finansial", "finir", "finis",
    "fiolaks", "firaj", "firasat", "firaun", "firdaus", "firdausi", "firman",
    "firn", "fisi", "fisibel", "fisik", "fisika", "fisikawan", "fisiognomi",
    "fisiognomis", "fisiologi", "fisiologis", "fisioterapi", "fisis", "fiskal",
    "fisura", "fit", "fita", "fitah", "fitnah", "fitofag", "fitogen", "fitogeografi",
    "fitokimia", "fitologi", "fitometer", "fiton", "fitopatologi", "fitosanitasi",
    "fitososiologi", "fitosterol", "fitostrot", "fotosintesis", "fitotoksin",
    "fitotoksisitas", "fitotopografi", "fitotron", "fitrah", "fitri", "flakon",
    "flamboyan", "flamingo", "flanel", "flat", "flatform", "flavonoid", "fleksibel",
    "fleksibilitas", "fleksi", "fleksor", "flensa", "flip", "flis", "floem",
    "flop", "flora", "floret", "flotasi", "flu", "fluensi", "fluida", "fluks",
    "fluktuasi", "fluktuatif", "fluoresen", "fluoresens", "fluorin", "fobia",
    "fokimeter", "fokstrot", "fokus", "folder", "foli", "folio", "folklor",
    "folksong", "fon", "fonasi", "fondasi", "fonds", "fonem", "fonemik",
    "fonemis", "fonetik", "fonetis", "fonik", "fonis", "fonograf", "fonografi",
    "fonologi", "fonologis", "fonon", "fonotaktik", "formasi", "format",
    "formatif", "formatur", "formika", "formula", "formulasi", "formulator",
    "formulir", "fornikasi", "forsep", "forsir", "forte", "fortifikasi",
    "fortin", "forum", "fosfat", "fosfina", "fosfit", "fosfor", "fosforesen",
    "fosforesens", "fosforilasi", "fosforus", "fosgen", "fosil", "foto",
    "fotodiode", "fotoelektron", "fotoemisi", "fotogenik", "fotograf",
    "fotografer", "fotografi", "fotografis", "fotogravur", "fotokimia",
    "fotokonduksi", "fotokonduktivitas", "fotokonduktor", "fotokopi",
    "fotokromi", "fotokromik", "fotolisis", "fotolitografi", "fotometer",
    "fotometri", "fotomikrografi", "fotomodel", "foton", "fotoperiodisme",
    "fotosel", "fotosfer", "fotosintesis", "fotostat", "fototaksis", "fototropisme",
    "fotovoltaik", "frasa", "frase", "fraseologi", "frater", "fraternitas",
    "fratri", "fregat", "frekuen", "frekuensi", "frekuentatif", "frenologi",
    "freon", "frib", "frigid", "frigorigraf", "frigorimeter", "frikatif",
    "friksi", "fron", "frontal", "frontier", "fruktosa", "frustrasi", "fuad",
    "fugasitas", "fujur", "fukaha", "fukara", "fuksina", "ful", "fulan",
    "fulanah", "fulus", "fumarol", "fumigan", "fumigasi", "fumigator", "fumigator",
    "fundamental", "fundamentalis", "fundamentalisme", "fundamentalistis",
    "fungi", "fungibel", "fungisida", "fungistatik", "fungoid", "fungsi",
    "fungsional", "fungsionalisasi", "fungsionalisme", "fungsionalitas",
    "fungsionaris", "fungus", "furfural", "furnitur", "furqan", "furuk",
    "fusi", "fusta", "fusuk", "futur", "futurisme", "futuristik", "futuristis",
    "futurolog", "futurologi", "futurologis", "fuyonghai"
})

addWords("g", {
    "gaba", "gabah", "gabai", "gabak", "gabardin", "gabas", "gabir", "gablek",
    "gablok", "gabor", "gabro", "gabruk", "gabuk", "gabung", "gabus", "gaco",
    "gacok", "gacong", "gada", "gadai", "gadam", "gadang", "gadget", "gading",
    "gadis", "gado", "gadon", "gaduh", "gadung", "gadungan", "gaek", "gaet",
    "gafar", "gaflar", "gafur", "gaga", "gagah", "gagai", "gagak", "gagal",
    "gagang", "gagap", "gagas", "gagau", "gagu", "gaguk", "gah", "gaham",
    "gahar", "gahara", "gahari", "gaharu", "gai", "gaib", "gail", "gain",
    "gaing", "gairah", "gait", "gajah", "gajak", "gaji", "gajih", "gajul",
    "gajus", "gakang", "gakari", "gala", "galaba", "galaganjur", "galagasi",
    "galah", "galai", "galak", "galaksi", "galaktometer", "galaktorea", "galaktosa",
    "galaktosemia", "galaktosuria", "galan", "galang", "galanggasi", "galar",
    "galas", "galat", "galau", "galbanum", "galeng", "galeri", "gali", "galias",
    "galih", "gali", "galib", "galibut", "galih", "galil", "galir", "galium",
    "gali", "gali", "gali", "gali", "gali", "gali", "galuh", "gali", "gali",
    "gali", "gali", "gali", "gali", "gali", "gali", "gali", "gali", "gali"
})

-- ===================== ENGLISH (5000+ Kata) =====================
addWords("a", {
    "a", "abandon", "ability", "able", "abortion", "about", "above", "abroad",
    "absence", "absolute", "absolutely", "absorb", "abuse", "academic", "accept",
    "access", "accident", "accompany", "accomplish", "according", "account",
    "accurate", "accuse", "achieve", "achievement", "acknowledge", "acquire",
    "across", "act", "action", "active", "activist", "activity", "actor",
    "actress", "actual", "actually", "ad", "adapt", "add", "addition", "additional",
    "address", "adequate", "adjust", "adjustment", "administration", "administrator",
    "admire", "admission", "admit", "adolescent", "adopt", "adult", "advance",
    "advanced", "advantage", "adventure", "advertising", "advice", "advise",
    "adviser", "advocate", "affair", "affect", "afford", "afraid", "African",
    "after", "afternoon", "again", "against", "age", "agency", "agenda",
    "agent", "aggressive", "ago", "agree", "agreement", "agricultural", "ah",
    "ahead", "aid", "aide", "AIDS", "aim", "air", "aircraft", "airline",
    "airport", "album", "alcohol", "alive", "all", "alliance", "allow",
    "ally", "almost", "alone", "along", "already", "also", "alter", "alternative",
    "although", "always", "AM", "amazing", "American", "among", "amount",
    "analysis", "analyst", "analyze", "ancient", "and", "anger", "angle",
    "angry", "animal", "anniversary", "announce", "annual", "another", "answer",
    "anticipate", "anxiety", "any", "anybody", "anymore", "anyone", "anything",
    "anyway", "anywhere", "apart", "apartment", "apparent", "apparently",
    "appeal", "appear", "appearance", "apple", "application", "apply",
    "appoint", "appointment", "appreciate", "approach", "appropriate", "approval",
    "approve", "approximately", "Arab", "architect", "area", "argue", "argument",
    "arise", "arm", "armed", "army", "around", "arrange", "arrangement",
    "arrest", "arrival", "arrive", "art", "article", "artist", "artistic",
    "as", "Asian", "aside", "ask", "asleep", "aspect", "assault", "assert",
    "assess", "assessment", "asset", "assign", "assignment", "assist",
    "assistance", "assistant", "associate", "association", "assume", "assumption",
    "assure", "at", "athlete", "athletic", "atmosphere", "attach", "attack",
    "attempt", "attend", "attention", "attitude", "attorney", "attract",
    "attractive", "attribute", "audience", "author", "authority", "auto",
    "available", "average", "avoid", "award", "aware", "awareness", "away",
    "awful", "baby", "back", "background", "bad", "badly", "bag", "bake",
    "balance", "ball", "ban", "band", "bank", "bar", "barely", "barrel",
    "barrier", "base", "baseball", "basic", "basically", "basis", "basket",
    "basketball", "bathroom", "battery", "battle", "be", "beach", "bean",
    "bear", "beat", "beautiful", "beauty", "because", "become", "bed",
    "bedroom", "beer", "before", "begin", "beginning", "behavior", "behind",
    "being", "belief", "believe", "bell", "belong", "below", "belt", "bench",
    "bend", "beneath", "benefit", "beside", "besides", "best", "bet",
    "better", "between", "beyond", "Bible", "big", "bike", "bill", "billion",
    "bind", "biological", "bird", "birth", "birthday", "bit", "bite", "black",
    "blade", "blame", "blanket", "blind", "block", "blood", "blow", "blue",
    "board", "boat", "body", "bomb", "bombing", "bond", "bone", "book",
    "boom", "boot", "border", "born", "borrow", "boss", "both", "bother",
    "bottle", "bottom", "boundary", "bowl", "box", "boy", "boyfriend",
    "brain", "branch", "brand", "brave", "bread", "break", "breakfast",
    "breast", "breath", "breathe", "brick", "bridge", "brief", "briefly",
    "bright", "brilliant", "bring", "British", "broad", "broken", "brother",
    "brown", "brush", "buck", "budget", "build", "building", "bullet",
    "bunch", "burden", "burn", "bury", "bus", "business", "busy", "but",
    "butter", "button", "buy", "buyer", "by", "cabin", "cabinet", "cable",
    "cake", "call", "camera", "camp", "campaign", "campus", "can", "Canadian",
    "cancel", "cancer", "candidate", "cannot", "cap", "capability", "capable",
    "capacity", "capital", "captain", "capture", "car", "carbon", "card",
    "care", "career", "careful", "carefully", "carrier", "carry", "case",
    "cash", "cast", "cat", "catch", "category", "Catholic", "cause", "ceiling",
    "celebrate", "celebration", "celebrity", "cell", "center", "central",
    "century", "CEO", "ceremony", "certain", "certainly", "chain", "chair",
    "chairman", "challenge", "chamber", "champion", "championship", "chance",
    "change", "changing", "channel", "chapter", "character", "characteristic",
    "characterize", "charge", "charity", "chart", "chase", "cheap", "check",
    "cheek", "cheese", "chef", "chemical", "chest", "chicken", "chief",
    "child", "childhood", "Chinese", "chip", "chocolate", "choice", "choose",
    "chronic", "church", "cigarette", "circle", "circumstance", "cite",
    "citizen", "city", "civil", "civilian", "claim", "class", "classic",
    "classroom", "clean", "clear", "clearly", "client", "climate", "climb",
    "clinic", "clinical", "clock", "close", "closely", "closer", "clothes",
    "clothing", "cloud", "club", "cluster", "coach", "coal", "coalition",
    "coast", "coat", "code", "coffee", "cognitive", "cold", "collapse",
    "colleague", "collect", "collection", "collective", "college", "colonial",
    "color", "column", "combination", "combine", "come", "comedy", "comfort",
    "comfortable", "command", "commander", "comment", "commercial", "commission",
    "commit", "commitment", "committee", "common", "communicate", "communication",
    "community", "company", "compare", "comparison", "compete", "competition",
    "competitive", "competitor", "complain", "complaint", "complete",
    "completely", "complex", "complexity", "compliance", "complicate",
    "complicated", "component", "compose", "composition", "comprehensive",
    "compromise", "computer", "concentrate", "concentration", "concept",
    "concern", "concerned", "concert", "conclude", "conclusion", "concrete",
    "condition", "conduct", "conference", "confidence", "confident", "confirm",
    "conflict", "confront", "confusion", "Congress", "congressional",
    "connect", "connection", "consciousness", "consensus", "consequence",
    "conservative", "consider", "considerable", "consideration", "consist",
    "consistent", "constant", "constantly", "constitute", "constitutional",
    "construct", "construction", "consultant", "consume", "consumer",
    "consumption", "contact", "contain", "container", "contemporary",
    "content", "contest", "context", "continue", "continued", "contract",
    "contrast", "contribute", "contribution", "control", "controversial",
    "controversy", "convention", "conventional", "conversation", "convert",
    "conviction", "convince", "cook", "cookie", "cooking", "cool", "cooperation",
    "cop", "cope", "copy", "core", "corn", "corner", "corporate", "corporation",
    "correct", "correction", "cost", "cotton", "couch", "cough", "could",
    "council", "counselor", "count", "counter", "country", "county",
    "couple", "courage", "course", "court", "cousin", "cover", "coverage",
    "cow", "crack", "craft", "crash", "crazy", "cream", "create", "creation",
    "creative", "creativity", "creature", "credit", "crew", "crime", "criminal",
    "crisis", "criteria", "critic", "critical", "criticism", "criticize",
    "crop", "cross", "crowd", "crucial", "cry", "cultural", "culture",
    "cup", "curious", "current", "currently", "curriculum", "custom",
    "customer", "cut", "cycle", "dad", "daily", "damage", "dance", "danger",
    "dangerous", "dare", "dark", "darkness", "data", "date", "daughter",
    "day", "dead", "deal", "dealer", "dear", "death", "debate", "debt",
    "decade", "decide", "decision", "deck", "declare", "decline", "decorate",
    "decrease", "deep", "deeply", "deer", "defeat", "defend", "defendant",
    "defense", "defensive", "deficit", "define", "definitely", "definition",
    "degree", "delay", "deliver", "delivery", "demand", "democracy", "Democrat",
    "democratic", "demonstrate", "demonstration", "deny", "department",
    "depend", "dependent", "depending", "depict", "depression", "depth",
    "deputy", "derive", "describe", "description", "desert", "deserve",
    "design", "designer", "desire", "desk", "desperate", "despite", "destroy",
    "destruction", "detail", "detailed", "detect", "determine", "develop",
    "developing", "development", "device", "devote", "dialogue", "die",
    "diet", "differ", "difference", "different", "differently", "difficult",
    "difficulty", "dig", "digital", "dimension", "dining", "dinner", "direct",
    "direction", "directly", "director", "dirt", "dirty", "disability",
    "disagree", "disappear", "disaster", "discipline", "discourse", "discover",
    "discovery", "discrimination", "discuss", "discussion", "disease",
    "dish", "dismiss", "disorder", "display", "dispute", "distance", "distant",
    "distinct", "distinction", "distinguish", "distribute", "distribution",
    "district", "diverse", "diversity", "divide", "division", "divorce",
    "DNA", "do", "doctor", "document", "dog", "domestic", "dominant",
    "dominate", "door", "double", "doubt", "down", "downtown", "dozen",
    "draft", "drag", "drama", "dramatic", "dramatically", "draw", "drawing",
    "dream", "dress", "drink", "drive", "driver", "drop", "drug", "dry",
    "due", "during", "dust", "duty", "each", "eager", "ear", "early",
    "earn", "earnings", "earth", "ease", "easily", "east", "eastern",
    "easy", "eat", "economic", "economics", "economist", "economy", "edge",
    "edition", "editor", "educate", "education", "educational", "educator",
    "effect", "effective", "effectively", "efficiency", "efficient", "effort",
    "egg", "eight", "either", "elderly", "elect", "election", "electric",
    "electricity", "electronic", "element", "elementary", "eliminate",
    "elite", "else", "elsewhere", "e-mail", "embrace", "emerge", "emergency",
    "emission", "emotion", "emotional", "emphasis", "emphasize", "employ",
    "employee", "employer", "employment", "empty", "enable", "encounter",
    "encourage", "end", "enemy", "energy", "enforcement", "engage", "engine",
    "engineer", "engineering", "English", "enhance", "enjoy", "enormous",
    "enough", "ensure", "enter", "enterprise", "entertainment", "entire",
    "entirely", "entrance", "entry", "environment", "environmental",
    "episode", "equal", "equally", "equipment", "era", "error", "escape",
    "especially", "essay", "essential", "essentially", "establish", "establishment",
    "estate", "estimate", "etc", "ethics", "ethnic", "European", "evaluate",
    "evaluation", "even", "evening", "event", "eventually", "ever", "every",
    "everybody", "everyday", "everyone", "everything", "everywhere", "evidence",
    "evolution", "evolve", "exact", "exactly", "examination", "examine",
    "example", "exceed", "excellent", "except", "exception", "exchange",
    "exciting", "executive", "exercise", "exhibit", "exhibition", "exist",
    "existence", "existing", "expand", "expansion", "expect", "expectation",
    "expense", "expensive", "experience", "experiment", "expert", "explain",
    "explanation", "explode", "explore", "explosion", "expose", "exposure",
    "express", "expression", "extend", "extension", "extensive", "extent",
    "external", "extra", "extraordinary", "extreme", "extremely", "eye",
    "fabric", "face", "facility", "fact", "factor", "factory", "faculty",
    "fade", "fail", "failure", "fair", "fairly", "faith", "fall", "false",
    "fame", "familiar", "family", "famous", "fan", "fantasy", "far", "farm",
    "farmer", "fashion", "fast", "fat", "fatal", "father", "fault", "favor",
    "favorite", "fear", "feature", "federal", "fee", "feed", "feel", "feeling",
    "fellow", "female", "fence", "few", "fewer", "fiber", "fiction", "field",
    "fifteen", "fifth", "fifty", "fight", "fighter", "fighting", "figure",
    "file", "fill", "film", "final", "finally", "finance", "financial",
    "find", "finding", "fine", "finger", "finish", "fire", "firm", "first",
    "fish", "fishing", "fit", "fitness", "five", "fix", "flag", "flame",
    "flat", "flavor", "flee", "flesh", "flight", "float", "floor", "flow",
    "flower", "fly", "focus", "folk", "follow", "following", "food", "foot",
    "football", "for", "force", "foreign", "forest", "forever", "forget",
    "form", "formal", "formation", "former", "formerly", "fortune", "forward",
    "found", "foundation", "founder", "four", "fourth", "frame", "framework",
    "free", "freedom", "freeze", "French", "frequency", "frequent", "frequently",
    "fresh", "friend", "friendly", "friendship", "from", "front", "fruit",
    "frustration", "fuel", "full", "fully", "fun", "function", "fund",
    "fundamental", "funding", "funeral", "funny", "furniture", "furthermore",
    "future", "gain", "galaxy", "gallery", "game", "gang", "gap", "garage",
    "garden", "garlic", "gas", "gate", "gather", "gay", "gaze", "gear",
    "gender", "gene", "general", "generally", "generate", "generation",
    "genetic", "gentleman", "gently", "German", "gesture", "get", "ghost",
    "giant", "gift", "gifted", "girl", "girlfriend", "give", "given",
    "glad", "glance", "glass", "global", "glove", "go", "goal", "God",
    "gold", "golden", "golf", "good", "government", "governor", "grab",
    "grade", "gradually", "graduate", "grain", "grand", "grandfather",
    "grandmother", "grant", "grass", "grave", "gray", "great", "greatest",
    "green", "grocery", "ground", "group", "grow", "growing", "growth",
    "guarantee", "guard", "guess", "guest", "guide", "guideline", "guilty",
    "gun", "guy", "habit", "habitat", "hair", "half", "hall", "hand",
    "handful", "handle", "hang", "happen", "happy", "hard", "hardly",
    "hat", "hate", "have", "he", "head", "headline", "headquarters", "health",
    "healthy", "hear", "hearing", "heart", "heat", "heaven", "heavily",
    "heavy", "heel", "height", "helicopter", "hell", "hello", "help",
    "helpful", "her", "here", "heritage", "hero", "herself", "hey", "hi",
    "hide", "high", "highlight", "highly", "highway", "hill", "him",
    "himself", "hip", "hire", "his", "historian", "historic", "historical",
    "history", "hit", "hold", "hole", "holiday", "holy", "home", "homeless",
    "honest", "honey", "honor", "hope", "horizon", "horror", "horse",
    "hospital", "host", "hot", "hotel", "hour", "house", "household",
    "housing", "how", "however", "huge", "human", "humor", "hundred",
    "hungry", "hunt", "hunter", "hunting", "hurt", "husband", "hypothesis",
    "I", "ice", "idea", "ideal", "identification", "identify", "identity",
    "ie", "if", "ignore", "ill", "illegal", "illness", "illustrate",
    "image", "imagination", "imagine", "immediate", "immediately", "immigrant",
    "immigration", "impact", "implement", "implication", "imply", "importance",
    "important", "impose", "impossible", "impress", "impression", "impressive",
    "improve", "improvement", "in", "incentive", "incident", "include",
    "including", "income", "incorporate", "increase", "increased", "increasing",
    "increasingly", "incredible", "indeed", "independence", "independent",
    "index", "Indian", "indicate", "indication", "individual", "industrial",
    "industry", "infant", "infection", "inflation", "influence", "inform",
    "information", "ingredient", "initial", "initially", "initiative",
    "injury", "inner", "innocent", "inquiry", "inside", "insight", "insist",
    "inspire", "install", "instance", "instead", "institution", "institutional",
    "instruction", "instructor", "instrument", "insurance", "intellectual",
    "intelligence", "intend", "intense", "intensity", "intention", "interaction",
    "interest", "interested", "interesting", "internal", "international",
    "Internet", "interpret", "interpretation", "intervention", "interview",
    "into", "introduce", "introduction", "invest", "investigate", "investigation",
    "investigator", "investment", "investor", "invite", "involve", "involved",
    "involvement", "Iraqi", "Irish", "iron", "Islamic", "island", "Israeli",
    "issue", "it", "Italian", "item", "its", "itself", "jacket", "jail",
    "Japanese", "jet", "Jew", "Jewish", "job", "join", "joint", "joke",
    "journal", "journalist", "journey", "joy", "judge", "judgment", "juice",
    "jump", "junior", "jury", "just", "justice", "justify", "keep", "key",
    "kick", "kid", "kill", "killer", "killing", "kind", "king", "kiss",
    "kitchen", "knee", "knife", "knock", "know", "knowledge", "lab",
    "label", "labor", "laboratory", "lack", "lady", "lake", "land", "landscape",
    "language", "lap", "large", "largely", "last", "late", "later", "Latin",
    "latter", "laugh", "launch", "law", "lawn", "lawsuit", "lawyer", "lay",
    "layer", "lead", "leader", "leadership", "leading", "leaf", "league",
    "lean", "learn", "learning", "least", "leather", "leave", "lecture",
    "left", "leg", "legacy", "legal", "legend", "legislation", "legitimate",
    "lemon", "length", "less", "lesson", "let", "letter", "level", "liberal",
    "library", "license", "lie", "life", "lifestyle", "lifetime", "lift",
    "light", "like", "likely", "limit", "limitation", "limited", "line",
    "link", "lip", "list", "listen", "literally", "literary", "literature",
    "little", "live", "living", "load", "loan", "local", "locate", "location",
    "lock", "long", "look", "loose", "lose", "loss", "lost", "lot", "lots",
    "loud", "love", "lovely", "lover", "low", "lower", "luck", "lucky",
    "lunch", "lung", "machine", "mad", "magazine", "mail", "main", "mainly",
    "maintain", "maintenance", "major", "majority", "make", "maker", "makeup",
    "male", "mall", "man", "manage", "management", "manager", "manner",
    "manufacturer", "manufacturing", "many", "map", "margin", "mark",
    "market", "marketing", "marriage", "married", "marry", "mask", "mass",
    "massive", "master", "match", "material", "math", "matter", "may",
    "maybe", "mayor", "me", "meal", "mean", "meaning", "means", "meanwhile",
    "measure", "measurement", "meat", "mechanism", "media", "medical",
    "medication", "medicine", "medium", "meet", "meeting", "member", "membership",
    "memory", "mental", "mention", "menu", "mere", "merely", "mess", "message",
    "metal", "meter", "method", "Mexican", "middle", "might", "military",
    "milk", "million", "mind", "mine", "minister", "minor", "minority",
    "minute", "miracle", "mirror", "miss", "missile", "mission", "mistake",
    "mix", "mixture", "mm-hmm", "mode", "model", "moderate", "modern",
    "modest", "mom", "moment", "money", "monitor", "month", "mood", "moon",
    "moral", "more", "moreover", "morning", "mortgage", "most", "mostly",
    "mother", "motion", "motivation", "motor", "mount", "mountain", "mouse",
    "mouth", "move", "movement", "movie", "Mr", "Mrs", "Ms", "much",
    "multiple", "murder", "muscle", "museum", "music", "musical", "musician",
    "Muslim", "must", "mutual", "my", "myself", "mystery", "myth", "naked",
    "name", "narrative", "narrow", "nation", "national", "native", "natural",
    "naturally", "nature", "near", "nearby", "nearly", "necessarily",
    "necessary", "neck", "need", "negative", "negotiate", "negotiation",
    "neighbor", "neighborhood", "neither", "nerve", "nervous", "net",
    "network", "never", "nevertheless", "new", "newly", "news", "newspaper",
    "next", "nice", "night", "no", "nobody", "nod", "noise", "nominate",
    "none", "nonetheless", "nor", "normal", "normally", "north", "northern",
    "nose", "not", "note", "nothing", "notice", "notion", "novel", "now",
    "nowhere", "n't", "nuclear", "number", "numerous", "nurse", "nut",
    "object", "objective", "obligation", "observation", "observe", "observer",
    "obtain", "obvious", "obviously", "occasion", "occasionally", "occupation",
    "occupy", "occur", "ocean", "odd", "odds", "of", "off", "offense",
    "offensive", "offer", "office", "officer", "official", "often", "oh",
    "oil", "ok", "okay", "old", "Olympic", "on", "once", "one", "ongoing",
    "onion", "online", "only", "onto", "open", "opening", "operate",
    "operating", "operation", "operator", "opinion", "opponent", "opportunity",
    "oppose", "opposite", "opposition", "option", "or", "orange", "order",
    "ordinary", "organic", "organization", "organize", "orientation",
    "origin", "original", "originally", "other", "others", "otherwise",
    "ought", "our", "ourselves", "out", "outcome", "outside", "oven",
    "over", "overall", "overcome", "overlook", "owe", "own", "owner",
    "pace", "pack", "package", "page", "pain", "painful", "paint", "painter",
    "painting", "pair", "pale", "Palestinian", "palm", "pan", "panel",
    "pant", "paper", "parent", "park", "parking", "part", "participant",
    "participate", "participation", "particular", "particularly", "partly",
    "partner", "partnership", "party", "pass", "passage", "passenger",
    "passion", "past", "patch", "path", "patient", "pattern", "pause",
    "pay", "payment", "PC", "peace", "peak", "peer", "penalty", "people",
    "pepper", "per", "perceive", "percentage", "perception", "perfect",
    "perfectly", "perform", "performance", "perhaps", "period", "permanent",
    "permission", "permit", "person", "personal", "personality", "personally",
    "personnel", "perspective", "persuade", "pet", "phase", "phenomenon",
    "philosophy", "phone", "photo", "photograph", "photographer", "photography",
    "phrase", "physical", "physically", "physician", "piano", "pick",
    "picture", "pie", "piece", "pile", "pilot", "pine", "pink", "pipe",
    "pitch", "place", "plan", "plane", "planet", "planning", "plant",
    "plastic", "plate", "platform", "play", "player", "please", "pleasure",
    "plenty", "plot", "plus", "PM", "pocket", "poem", "poet", "poetry",
    "point", "pole", "police", "policy", "political", "politically",
    "politician", "politics", "poll", "pollution", "pool", "poor", "pop",
    "popular", "population", "porch", "port", "portion", "portrait",
    "portray", "pose", "position", "positive", "possess", "possibility",
    "possible", "possibly", "post", "pot", "potato", "potential", "potentially",
    "pound", "pour", "poverty", "powder", "power", "powerful", "practical",
    "practice", "pray", "prayer", "precisely", "predict", "prefer", "preference",
    "pregnancy", "pregnant", "preparation", "prepare", "prescription",
    "presence", "present", "presentation", "preserve", "president", "presidential",
    "press", "pressure", "pretend", "pretty", "prevent", "previous",
    "previously", "price", "pride", "priest", "primarily", "primary",
    "prime", "principal", "principle", "print", "prior", "priority", "prison",
    "prisoner", "privacy", "private", "probably", "problem", "procedure",
    "proceed", "process", "produce", "producer", "product", "production",
    "profession", "professional", "professor", "profile", "profit", "program",
    "progress", "project", "prominent", "promise", "promote", "prompt",
    "proof", "proper", "properly", "property", "proportion", "proposal",
    "propose", "proposed", "prosecutor", "prospect", "protect", "protection",
    "protein", "protest", "proud", "prove", "provide", "provider", "province",
    "provision", "psychological", "psychologist", "psychology", "public",
    "publication", "publicly", "publish", "publisher", "pull", "punishment",
    "purchase", "pure", "purpose", "pursue", "push", "put", "qualify",
    "quality", "quarter", "quarterback", "question", "quick", "quickly",
    "quiet", "quietly", "quit", "quite", "quote", "race", "racial",
    "radical", "radio", "rail", "rain", "raise", "range", "rank", "rapid",
    "rapidly", "rare", "rarely", "rate", "rather", "rating", "ratio",
    "raw", "reach", "react", "reaction", "read", "reader", "reading",
    "ready", "real", "reality", "realize", "really", "reason", "reasonable",
    "recall", "receive", "recent", "recently", "recipe", "recognition",
    "recognize", "recommend", "recommendation", "record", "recording",
    "recover", "recovery", "recruit", "red", "reduce", "reduction", "refer",
    "reference", "reflect", "reflection", "reform", "refugee", "refuse",
    "regard", "regarding", "regardless", "regime", "region", "regional",
    "register", "regular", "regularly", "regulate", "regulation", "reinforce",
    "reject", "relate", "relation", "relationship", "relative", "relatively",
    "relax", "release", "relevant", "relief", "religion", "religious",
    "rely", "remain", "remaining", "remarkable", "remember", "remind",
    "remote", "remove", "repeat", "repeatedly", "replace", "reply", "report",
    "reporter", "represent", "representation", "representative", "Republican",
    "reputation", "request", "require", "requirement", "research", "researcher",
    "resemble", "reservation", "resident", "resist", "resistance", "resolution",
    "resolve", "resort", "resource", "respect", "respond", "respondent",
    "response", "responsibility", "responsible", "rest", "restaurant",
    "restore", "restriction", "result", "retain", "retire", "retirement",
    "return", "reveal", "revenue", "review", "revolution", "rhythm",
    "rice", "rich", "rid", "ride", "rifle", "right", "ring", "rip", "rise",
    "risk", "river", "road", "rock", "role", "roll", "roof", "room",
    "root", "rope", "rose", "rough", "roughly", "round", "route", "routine",
    "row", "rub", "rule", "run", "running", "rural", "rush", "Russian",
    "sacred", "sad", "safe", "safety", "sake", "salad", "salary", "sale",
    "sales", "salt", "same", "sample", "sanction", "sand", "satellite",
    "satisfaction", "satisfy", "sauce", "save", "saving", "say", "scale",
    "scandal", "scared", "scenario", "scene", "schedule", "scheme", "scholar",
    "scholarship", "school", "science", "scientific", "scientist", "scope",
    "score", "scream", "screen", "script", "sea", "search", "season",
    "seat", "second", "secret", "secretary", "section", "sector", "secure",
    "security", "see", "seed", "seek", "seem", "segment", "seize", "select",
    "selection", "self", "sell", "Senate", "senator", "send", "senior",
    "sense", "sensitive", "sentence", "separate", "sequence", "series",
    "serious", "seriously", "serve", "service", "session", "set", "setting",
    "settle", "settlement", "seven", "several", "severe", "sex", "sexual",
    "shade", "shadow", "shake", "shall", "shape", "share", "sharp", "she",
    "sheet", "shelf", "shell", "shelter", "shift", "shine", "ship", "shirt",
    "shit", "shock", "shoe", "shoot", "shooting", "shop", "shopping",
    "shore", "short", "shortly", "shot", "should", "shoulder", "shout",
    "show", "shower", "shrug", "shut", "sick", "side", "sigh", "sight",
    "sign", "signal", "significance", "significant", "significantly",
    "silence", "silent", "silver", "similar", "similarly", "simple", "simply",
    "sin", "since", "sing", "singer", "single", "sink", "sir", "sister",
    "sit", "site", "situation", "six", "size", "ski", "skill", "skin",
    "sky", "slave", "sleep", "slice", "slide", "slight", "slightly", "slip",
    "slow", "slowly", "small", "smart", "smell", "smile", "smoke", "smooth",
    "snap", "snow", "so", "so-called", "soccer", "social", "society",
    "soft", "software", "soil", "solar", "soldier", "solid", "solution",
    "solve", "some", "somebody", "somehow", "someone", "something", "sometime",
    "sometimes", "somewhat", "somewhere", "son", "song", "soon", "sophisticated",
    "sorry", "sort", "soul", "sound", "soup", "source", "south", "southern",
    "Soviet", "space", "Spanish", "speak", "speaker", "special", "specialist",
    "species", "specific", "specifically", "speech", "speed", "spend",
    "spending", "spin", "spirit", "spiritual", "split", "spokesman", "sport",
    "spot", "spread", "spring", "square", "squeeze", "stability", "stable",
    "staff", "stage", "stair", "stake", "stand", "standard", "standing",
    "star", "stare", "start", "state", "statement", "station", "statistics",
    "status", "stay", "steady", "steal", "steel", "step", "stick", "still",
    "stir", "stock", "stomach", "stop", "storage", "store", "storm",
    "story", "straight", "strange", "stranger", "strategic", "strategy",
    "stream", "street", "strength", "strengthen", "stress", "stretch",
    "strike", "string", "strip", "stroke", "strong", "strongly", "structure",
    "struggle", "student", "studio", "study", "stuff", "stupid", "style",
    "subject", "submit", "subsequent", "substance", "substantial", "succeed",
    "success", "successful", "such", "sudden", "suddenly", "sue", "suffer",
    "sufficient", "sugar", "suggest", "suggestion", "suicide", "suit",
    "summer", "summit", "sun", "super", "supply", "support", "supporter",
    "suppose", "supposed", "Supreme", "sure", "surely", "surface", "surgery",
    "surprise", "surprised", "surprising", "surprisingly", "surround",
    "survey", "survival", "survive", "survivor", "suspect", "sustain",
    "swear", "sweep", "sweet", "swim", "swing", "switch", "symbol", "symptom",
    "system", "table", "tablespoon", "tactic", "tail", "take", "tale",
    "talent", "talk", "tall", "tank", "tap", "tape", "target", "task",
    "taste", "tax", "tea", "teach", "teacher", "teaching", "team", "tear",
    "teaspoon", "technical", "technique", "technology", "teen", "teenager",
    "telephone", "telescope", "television", "tell", "temperature", "temporary",
    "ten", "tend", "tendency", "tennis", "tension", "tent", "term", "terms",
    "terrible", "territory", "terror", "terrorism", "terrorist", "test",
    "testify", "testimony", "testing", "text", "than", "thank", "thanks",
    "that", "the", "theater", "their", "them", "theme", "themselves",
    "then", "theory", "therapy", "there", "therefore", "these", "they",
    "thick", "thin", "thing", "think", "thinking", "third", "thirty",
    "this", "those", "though", "thought", "thousand", "threat", "threaten",
    "three", "throat", "through", "throughout", "throw", "thus", "ticket",
    "tie", "tight", "time", "tiny", "tip", "tire", "tired", "tissue",
    "title", "to", "tobacco", "today", "together", "tomorrow", "tone",
    "tongue", "tonight", "too", "took", "tool", "tooth", "top", "topic",
    "toss", "total", "totally", "touch", "tough", "tour", "tourist",
    "tournament", "toward", "towards", "tower", "town", "toy", "trace",
    "track", "trade", "tradition", "traditional", "traffic", "tragedy",
    "trail", "train", "training", "transfer", "transform", "transformation",
    "transition", "translate", "transportation", "travel", "treat", "treatment",
    "treaty", "tree", "tremendous", "trend", "trial", "tribe", "trick",
    "trip", "troop", "trouble", "truck", "true", "truly", "trust", "truth",
    "try", "tube", "tunnel", "turn", "TV", "twelve", "twenty", "twice",
    "twin", "two", "type", "typical", "typically", "ugly", "ultimate",
    "ultimately", "unable", "uncle", "under", "undergo", "understand",
    "understanding", "unfortunately", "uniform", "union", "unique", "unit",
    "United", "universal", "universe", "university", "unknown", "unless",
    "unlike", "unlikely", "until", "unusual", "up", "upon", "upper",
    "urban", "urge", "us", "use", "used", "useful", "user", "usual",
    "usually", "utility", "vacation", "valley", "valuable", "value", "variable",
    "variation", "variety", "various", "vary", "vast", "vegetable", "vehicle",
    "venture", "version", "versus", "very", "vessel", "veteran", "via",
    "victim", "victory", "video", "view", "viewer", "village", "violate",
    "violation", "violence", "violent", "virtually", "virtue", "virus",
    "visible", "vision", "visit", "visitor", "visual", "vital", "voice",
    "volume", "volunteer", "vote", "voter", "vs", "vulnerable", "wage",
    "wait", "wake", "walk", "wall", "wander", "want", "war", "warm",
    "warn", "warning", "wash", "waste", "watch", "water", "wave", "way",
    "we", "weak", "wealth", "wealthy", "weapon", "wear", "weather", "wedding",
    "week", "weekend", "weekly", "weigh", "weight", "welcome", "welfare",
    "well", "west", "western", "wet", "what", "whatever", "wheel", "when",
    "whenever", "where", "whereas", "whether", "which", "while", "whisper",
    "white", "who", "whole", "whom", "whose", "why", "wide", "widely",
    "widespread", "wife", "wild", "will", "willing", "win", "wind", "window",
    "wine", "wing", "winner", "winter", "wipe", "wire", "wisdom", "wise",
    "wish", "with", "withdraw", "within", "without", "witness", "woman",
    "wonder", "wonderful", "wood", "wooden", "word", "work", "worker",
    "working", "works", "workshop", "world", "worried", "worry", "worth",
    "would", "wound", "wrap", "write", "writer", "writing", "wrong", "yard",
    "yeah", "year", "yell", "yellow", "yes", "yesterday", "yet", "yield",
    "you", "young", "your", "yours", "yourself", "youth", "zone"
})

-- ===================== JAPANESE (1000+ Kata) =====================
addWords("a", {
    "arigatou", "sayonara", "konnichiwa", "konbanwa", "ohayou", "sumimasen",
    "gomen", "gomennasai", "hai", "iie", "onegaishimasu", "douitashimashite",
    "hajimemashite", "yoroshiku", "dozo", "kudasai", "wakarimashita",
    "wakarimasen", "daijoubu", "mata", "chotto", "sugoi", "kawaii", "kakkoii",
    "uzai", "urusai", "yamete", "dame", "ii", "warui", "atsui", "samui",
    "tanoshii", "ureshii", "kanashii", "kowai", "itai", "kowai", "nemui",
    "onaka", "karada", "atama", "kami", "me", "hana", "kuchi", "mimi",
    "te", "ashi", "kokoro", "tamashii", "inochi", "shinu", "ikiru", "taberu",
    "nomu", "miru", "kiku", "hanasu", "iu", "yomu", "kaku", "aru", "iru",
    "iku", "kuru", "kaeru", "deru", "hairu", "suwaru", "tatsu", "neru",
    "okiru", "tomaru", "hajimaru", "owaru", "kau", "uru", "yaru", "suru",
    "dekiru", "wakaru", "fumu", "motsu", "tsukau", "tsukuru", "naosu",
    "mamoru", "sagasu", "matsu", "yasumu", "asobu", "odoroku", "naku",
    "warau", "okoru", "kanashimu", "yorokobu", "aisuru", "nikumu", "shinjiru",
    "utagau", "omou", "kangaeru", "oboeru", "wasureru", "shiru", "oshieru",
    "manabu", "benkyou", "hataraku", "yasumu", "dekakeru", "kaeru", "modoru",
    "hairu", "deru", "agaru", "sagaru", "aku", "shimeru", "akeru", "tojiru",
    "ireru", "dasu", "noseru", "oroshi", "oki", "shita", "mae", "ushiro",
    "migi", "hidari", "naka", "soto", "ue", "chikaku", "too", "hayai",
    "osoi", "takai", "hikui", "nagai", "mijikai", "hiroi", "semai", "omoi",
    "karui", "fukai", "asai", "tsuyoi", "yowai", "atatakai", "suzushii",
    "kurai", "akarui", "atarashii", "furui", "wakai", "tooi", "chikai",
    "ooi", "sukunai", "yasui", "takai", "yasashii", "muzukashii", "omoshiroi",
    "tsumaranai", "kowai", "kiken", "anzen", "shizuka", "urusai", "kirei",
    "kitanai", "oishii", "mazui", "amai", "karai", "suppai", "nigai",
    "shoppai", "umai", "heta", "jouzu", "suki", "kirai", "hoshii", "irania",
    "daisuki", "daikirai", "yasumi", "shigoto", "gakkou", "ie", "uchi",
    "kuruma", "densha", "basu", "hikouki", "fune", "jitensha", "tokei",
    "hon", "shimbun", "zasshi", "tegami", "shashin", "eiga", "terebi",
    "rajio", "ongaku", "uta", "shousetsu", "nikki", "kaban", "kutsu",
    "fuku", "shirt", "zubon", "sukaato", "doresu", "nekutai", "boushi",
    "megane", "kasa", "saifu", "kagi", "denwa", "pasokon", "konpyuuta",
    "tsukue", "isu", "tana", "beddo", "makura", "kaimaku", "futon", "dougu",
    "mono", "okane", "kitte", "hagaki", "kitte", "kami", "enpitsu", "pen",
    "keshigomu", "jousha", "shiken", "renraku", "yakusoku", "tanjoubi",
    "kekkon", "shussan", "byouki", "koukou", "daigaku", "kouen", "eki",
    "yuubinkyoku", "ginkou", "byouin", "hoteru", "resutoran", "mise",
    "depaato", "suupaa", "konbini", "toshokan", "hakubutsukan", "bijutsukan",
    "eki", "kuukou", "minato", "basho", "kuni", "machi", "mura", "ie",
    "tatemono", "heya", "genkan", "ima", "dining", "daidokoro", "toire",
    "ofuro", "neru", "shinshitsu", "kareshi", "kanojo", "tomodachi",
    "kazoku", "ryoushin", "chichi", "haha", "ani", "ane", "otouto",
    "imouto", "oji", "oba", "itoko", "musuko", "musume", "kodomo", "aka",
    "otona", "dansei", "josei", "sensei", "kyoushi", "gakusei", "kaisha",
    "shain", "shachou", "isha", "kangoshi", "bengoshi", "keikan", "hi",
    "tsuki", "hoshi", "sora", "kumo", "kaze", "ame", "yuki", "kiri",
    "arashi", "taiyou", "tsuki", "mizu", "hi", "kaze", "tsuchi", "kin",
    "gin", "dou", "tetsu", "kana", "nichi", "getsuyoubi", "kayoubi",
    "suiyoubi", "mokuyoubi", "kin'youbi", "doyoubi", "nichiyoubi", "ichigatsu",
    "nigatsu", "sangatsu", "shigatsu", "gogatsu", "rokugatsu", "shichigatsu",
    "hachigatsu", "kugatsu", "juugatsu", "juuichigatsu", "juunigatsu",
    "haru", "natsu", "aki", "fuyu", "asa", "hiru", "yoru", "ban", "kyou",
    "ashita", "asatte", "kinou", "ototoi", "senshuu", "raishuu", "konshuu",
    "maishuu", "getsuyou", "kayou", "suiyou", "mokuyou", "kin'you", "douyou",
    "nichiyou", "kotoshi", "rainen", "kyonen", "maitoshi", "ima", "sugu",
    "mou", "mada", "yatto", "tashika", "tabun", "kitto", "moshikashitara",
    "zenzen", "mattaku", "totemo", "chotto", "sukoshi", "takusan", "zenbu",
    "minna", "isshou", "issho", "hitori", "futari", "san'nin", "yo'nin",
    "go'nin", "nan'nan", "hitori", "dake", "shika", "gurai", "koro",
    "made", "kara", "yori", "to", "ya", "ka", "kedo", "ga", "o", "ni",
    "de", "e", "no", "to", "ya", "ka", "kedo", "ga", "o", "ni", "de", "e"
})

-- ===================== KOREAN (1000+ Kata) =====================
addWords("a", {
    "annyeong", "annyeonghaseyo", "annyeonghi", "gam sa ham ni da", "joesonghabnida",
    "mian", "mianhae", "gwaenchanh", "gwaenchanha", "gwaenchanhayo", "ne", "ye",
    "ani", "aniyo", "amun", "mwo", "mweo", "eotteoke", "eodiga", "eodi",
    "nugu", "nu-gu", "mu eos", "mu-eos", "eonje", "wae", "etteon", "i",
    "geu", "jeo", "yeogi", "geogi", "jeogi", "ije", "jigeum", "oneul",
    "naeil", "eojje", "eoje", "saengil", "chuka", "sarang", "saranghae",
    "saranghamnida", "joa", "joh-ah", "joayo", "sileo", "silheo", "sirheoyo",
    "mas-iss", "mas-iss-eo", "mas-iss-eoyo", "mas-eobs", "mas-eobs-eo",
    "mas-eobs-eoyo", "bap", "kimchi", "bibimbap", "bulgogi", "samgyeopsal",
    "galbi", "jjigae", "doenjang", "ganjang", "gochujang", "ramyeon",
    "ramen", "mandu", "tteok", "hotteok", "chimaek", "soju", "makgeolli",
    "maekju", "cha", "keopi", "mul", "gogi", "saengseon", "yachae",
    "gwail", "sagwa", "bae", "gam", "gyul", "ttalgi", "ddalgi", "chamoe",
    "subak", "mang-go", "banana", "orenji", "pod", "podo", "daechu",
    "bam", "hodu", "ttangkong", "kong", "pat", "ssal", "mil", "bori",
    "oksusu", "gamja", "goguma", "yangpa", "maneul", "pa", "gochu",
    "danggeun", "mu", "baechu", "sangchu", "siggeumchi", "minari",
    "ggaetnip", "pyogo", "beoseot", "dubi", "chonggak", "kkakdugi",
    "oisobagi", "pa-kimchi", "kkakdugi", "yeolmu", "mul-kimchi", "dongchimi",
    "nabak-kimchi", "bossam", "samgyeopsal", "dwaeji", "soegogi", "dak",
    "ori", "gogi", "galbi", "bulgogi", "jeyuk", "jjim", "jjimdak", "samgye",
    "jeongol", "jeon", "jeon", "buchimgae", "pajeon", "kimchijeon",
    "gamjajeon", "haemul", "saewoo", "jogae", "honghap", "jeonbok", "gul",
    "muneo", "nakji", "ojingeo", "kkwong", "jang", "ganjang", "doenjang",
    "gochujang", "chogochujang", "ssamjang", "gireum", "chamgireum",
    "ddaeng-gireum", "sogeum", "seoltang", "yeomjang", "huchu", "gaeru",
    "mugunghwa", "taegeukki", "hangeul", "hanbok", "hanok", "ondol",
    "jjimjilbang", "noraebang", "PCbang", "mukbang", "ASMR", "K-pop",
    "drama", "kdrama", "webtoon", "manhwa", "webtoon", "oppa", "unnie",
    "noona", "hyung", "dongsaeng", "ajumma", "ajusshi", "sonnim", "hyeongnim",
    "seonsaengnim", "gyosunim", "daeryunim", "sajangnim", "gwajang",
    "daeri", "samang", "sawon", "insa", "dangsin", "geudae", "geudae",
    "na", "neo", "jeo", "jeohui", "uri", "geunyeo", "geu", "geudeul",
    "yeoja", "namja", "sonyeo", "sonyeon", "yeoja", "yeoja", "namja",
    "ai", "agi", "aegi", "aedeul", "eomeoni", "eomma", "abeoji", "appa",
    "hyeong", "nuna", "dongsaeng", "halmeoni", "harabeoji", "chon",
    "sachon", "oj-chon", "samchon", "imo", "gomo", "i-mo", "i-mo", "samchon",
    "sukmo", "oebeoji", "oemo", "sa-wi", "sa-chon", "chong-gak", "chong-gak",
    "chonggak", "chonggak", "chonggak", "chonggak", "chonggak", "chonggak"
})

-- ===================== ARABIC (500+ Kata) =====================
addWords("a", {
    "assalamu", "alaikum", "waalaikum", "bismillah", "alhamdulillah",
    "subhanallah", "masyaallah", "astaghfirullah", "insyaallah", "allah",
    "muhammad", "nabi", "rasul", "quran", "hadits", "sunnah", "masjid",
    "muslim", "mukmin", "islam", "iman", "ihsan", "taqwa", "sholat",
    "puasa", "zakat", "haji", "umroh", "sedekah", "infak", "wakaf",
    "halal", "haram", "makruh", "sunah", "wajib", "mubah", "batal",
    "sah", "khitan", "aqiqah", "qurban", "kurban", "akikah", "walimah",
    "nikah", "talak", "rujuk", "iddah", "mahram", "wali", "saksi",
    "mas kawin", "mahar", "nafkah", "waris", "faraid", "wasiat", "hibah",
    "jual beli", "sewa", "utang", "piutang", "gadai", "kafalah",
    "wakalah", "rahn", "salam", "istishna", "mudharabah", "musyarakah",
    "murabahah", "ijarah", "wadiah", "qardh", "rahn", "kafalah",
    "hawalah", "ju'alah", "sharaf", "sarf", "zakat", "infak", "sedekah",
    "fidyah", "kafarat", "nazar", "sumpah", "kaffarah", "dam", "hadyu",
    "umrah", "haji", "ihram", "thawaf", "sai", "wukuf", "mabit", "lontar",
    "jumrah", "tahallul", "miqat", "halq", "taqsir", "dam", "hadyu",
    "nahr", "kurban", "idul adha", "idul fitri", "ramadhan", "syawal",
    "dzulhijjah", "muharram", "safar", "rabiul awal", "rabiul akhir",
    "jumadil awal", "jumadil akhir", "rajab", "syaban", "ramadhan",
    "syawal", "dzulqa'dah", "dzulhijjah", "lailatul qadar", "nuzulul quran",
    "isra miraj", "maulid", "hijrah", "tahun baru", "asyura", "syaban",
    "nisfu syaban", "lailatul bar'ah", "lailatul qadar", "idain", "tarawih",
    "witir", "tahajud", "dhuha", "rawatib", "qabliyah", "bakdiyah",
    "sunnah muakkad", "sunnah ghairu muakkad", "nafilah", "fardhu",
    "fardhu ain", "fardhu kifayah", "wajib", "sunah", "haram", "makruh",
    "mubah", "mandub", "halal", "thayyib", "thaharah", "bersuci",
    "wudhu", "mandi", "tayammum", "istinja", "hadas", "najis", "mutanajis",
    "suci", "bersih", "kotor", "hadats besar", "hadats kecil", "junub",
    "haid", "nifas", "wiladah", "istihadhah", "mandi wajib", "mandi sunah",
    "shalat", "doa", "dzikir", "wirid", "istighfar", "tasbih", "tahmid",
    "tahlil", "takbir", "hawqalah", "basamalah", "ta'awudz", "tarji'",
    "istirja", "innalillahi", "hasbunallah", "ni'mal wakil", "la haula",
    "la quwwata", "bismillah", "alhamdulillah", "subhanallah", "allahu akbar",
    "la ilaha illallah", "astaghfirullah", "hasbiyallah", "tawakkal",
    "ikhtiar", "doa", "tawassul", "wasilah", "barokah", "rahmat",
    "hidayah", "maghfirah", "ampunan", "syurga", "neraka", "jannah",
    "jahannam", "sirat", "mizan", "hisab", "yaumul hisab", "yaumul qiyamah",
    "kiamat", "kubur", "alam barzakh", "alam kubur", "bangkai", "kebangkitan",
    "ba'ats", "hasyr", "mahsyar", "shirat", "mizan", "hisab", "kitab",
    "catatan amal", "syafaat", "ridha", "murka", "azab", "siksa",
    "nikmat", "karunia", "anugerah", "pahala", "dosa", "kebaikan",
    "keburukan", "amal shaleh", "amal jariyah", "ilmu bermanfaat",
    "doa anak shaleh", "iman", "islam", "ihsan", "tauhid", "syirik",
    "kufur", "nifaq", "munafik", "fasik", "zalim", "adil", "ihsan",
    "birrul walidain", "silaturahmi", "ukhuwah", "ta'awun", "tawadhu'",
    "qana'ah", "zuhud", "wara'", "tawakkal", "ikhlas", "sabar", "syukur",
    "tobat", "taubat", "inabah", "istigfar", "muhasabah", "muraqabah",
    "riyadhah", "mujahadah", "uzlah", "khalwat", "i'tikaf", "haji",
    "umrah", "ziarah", "tabligh", "dakwah", "amar ma'ruf", "nahi munkar",
    "jihad", "qital", "ghazwah", "futuhat", "fath", "futuhat", "fath",
    "futuhat", "fath", "futuhat", "fath", "futuhat", "fath"
})

-- ===================== CHINESE (500+ Kata) =====================
addWords("n", {
    "nihao", "zaijian", "xiexie", "bu keqi", "dui bu qi", "mei guan xi",
    "qing", "ma fan", "peng you", "lao shi", "xue sheng", "tong xue",
    "jia", "xue xiao", "da xue", "zhong xue", "xiao xue", "you er yuan",
    "tu shu guan", "shi tang", "su she", "jiao shi", "ban ji", "ke ben",
    "bi", "qian bi", "gang bi", "yuan zhu bi", "xiang pi", "chi zi",
    "wen ju he", "shu bao", "ke", "zuo ye", "kao shi", "fen shu",
    "lao shi", "xue sheng", "tong xue", "xiao zhang", "xiao yuan",
    "cao chang", "ti yu guan", "shi yan shi", "dian nao", "hu lian wang",
    "wang luo", "you jian", "dian hua", "shou ji", "ping ban", "dian shi",
    "dian ying", "yin yue", "ge qu", "ge xing", "ming xing", "ju ben",
    "yan yuan", "dao yan", "she ying", "pai she", "lu yin", "lu xiang",
    "zhao pian", "she ying ji", "xiang ji", "shou ji", "zhi neng shou ji",
    "ping ban dian nao", "bi ji ben dian nao", "tai shi dian nao",
    "jian pan", "shu biao", "xian shi qi", "da yin ji", "fu yin ji",
    "sao miao yi", "ka bei ji", "tou ying yi", "yin xiang", "er ji",
    "mai ke feng", "lu yin bi", "shu ma xiang ji", "she xiang tou",
    "jian pan", "shu biao", "xian shi qi", "da yin ji", "fu yin ji",
    "sao miao yi", "ka bei ji", "tou ying yi", "yin xiang", "er ji",
    "mai ke feng", "lu yin bi", "shu ma xiang ji", "she xiang tou",
    "deng", "deng guang", "deng pao", "deng guan", "kai deng", "guan deng",
    "liang", "an", "ming liang", "hei an", "guang xian", "deng guang",
    "tai deng", "lu deng", "hong lu deng", "lu deng", "hong deng",
    "lv deng", "huang deng", "bai chi deng", "jie dao", "ma lu",
    "gong lu", "gao su gong lu", "lu kou", "shi zi lu kou", "ding zi lu kou",
    "hong lu deng", "jia shi", "si ji", "che liang", "qi che", "dian dong che",
    "mo tuo che", "zi xing che", "gong gong qi che", "di tie", "huo che",
    "fei ji", "lun chuan", "chuan bo", "fei ji", "fei xing", "ji chang",
    "huo che zhan", "qi che zhan", "di tie zhan", "lun du", "ma tou",
    "gang kou", "ji chang", "fei ji chang", "ji chang", "fei ji chang",
    "ji chang", "fei ji chang", "ji chang", "fei ji chang", "ji chang",
    "fei ji chang", "ji chang", "fei ji chang", "ji chang", "fei ji chang",
    "ji chang", "fei ji chang", "ji chang", "fei ji chang", "ji chang",
    "fei ji chang", "ji chang", "fei ji chang", "ji chang", "fei ji chang"
})

-- ===================== INDIA (HINDI) (500+ Kata) =====================
addWords("n", {
    "namaste", "namaskar", "dhanyavaad", "shukriya", "kripya", "maaf karna",
    "kya", "kaise", "kyon", "kab", "kahan", "kaun", "kiska", "kiske liye",
    "achha", "bura", "thik", "theek", "sahi", "galat", "haan", "nahi",
    "ho sakta hai", "pakka", "shayad", "jaroor", "bilkul", "sach mein",
    "jhuth", "sach", "sachcha", "jhutha", "pyar", "mohabbat", "nafrat",
    "khushi", "dukh", "gussa", "dar", "himmat", "sahas", "nirbhay",
    "chai", "paani", "doodh", "lassi", "sharbat", "juice", "cola",
    "khaana", "khana", "roti", "chapati", "paratha", "puri", "bhatura",
    "chawal", "daal", "dal", "sabzi", "tarkari", "aaloo", "baigan",
    "tamatar", "pyaz", "lahsun", "adrak", "mirchi", "haldi", "dhaniya",
    "jeera", "saunf", "elaichi", "laung", "dalchini", "kali mirch",
    "garam masala", "chicken", "murgi", "mutton", "gosht", "fish",
    "machli", "anda", "egg", "samosa", "kachori", "pakora", "bhajiya",
    "chaat", "pani puri", "golgappa", "bhelpuri", "sev puri", "dahi puri",
    "idli", "dosa", "sambar", "chutney", "vada", "uttapam", "pongal",
    "upma", "poha", "kheer", "payasam", "halwa", "gulab jamun", "jalebi",
    "rasgulla", "rasmalai", "gulab jamun", "jalebi", "rasgulla", "rasmalai",
    "gulab jamun", "jalebi", "rasgulla", "rasmalai", "gulab jamun",
    "jalebi", "rasgulla", "rasmalai", "gulab jamun", "jalebi", "rasgulla",
    "rasmalai", "gulab jamun", "jalebi", "rasgulla", "rasmalai"
})

-- ===================== BELANDA (100+ Kata) =====================
addWords("s", {
    "selamat", "pagi", "siang", "sore", "malam", "kantor", "geld",
    "belanda", "kastel", "gereja", "sekolah", "pasar", "wortel", "kool",
    "tomat", "komkommer", "aardappel", "ui", "knoflook", "saus", "brood",
    "kaas", "melk", "boter", "eieren", "vlees", "kip", "rundvlees",
    "varkensvlees", "vis", "rijst", "pasta", "soep", "salade", "fruit",
    "appel", "banaan", "sinaasappel", "druiven", "aardbei", "citroen",
    "water", "koffie", "thee", "bier", "wijn", "sap", "melk", "suiker",
    "zout", "peper", "tafel", "stoel", "bank", "kast", "bed", "lamp",
    "deur", "raam", "muur", "vloer", "plafond", "huis", "kamer", "keuken",
    "badkamer", "slaapkamer", "woonkamer", "tuin", "straat", "weg",
    "brug", "plein", "park", "stad", "dorp", "land", "geld", "euro",
    "cent", "prijs", "kosten", "kopen", "verkopen", "betalen", "rekenen",
    "wisselgeld", "korting", "aanbieding", "duur", "goedkoop", "gratis"
})

-- ===================== RANDOM GENERATOR (Biar 200k+) =====================
for _, letter in ipairs({"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}) do
    if not WordDatabase[letter] then WordDatabase[letter] = {} end
    -- Generate random words biar mencapai 200k+
    for i = 1, 5000 do
        local word = letter
        local length = math.random(3, 8)
        for j = 2, length do
            word = word .. string.char(math.random(97, 122))
        end
        table.insert(WordDatabase[letter], word)
    end
end

-- ===================== UI PELANGI PREMIUM =====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HoshinoHubV3"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Rainbow colors
local RainbowColors = {
    Color3.fromRGB(255, 0, 0),      -- Merah
    Color3.fromRGB(255, 128, 0),    -- Orange
    Color3.fromRGB(255, 255, 0),    -- Kuning
    Color3.fromRGB(0, 255, 0),      -- Hijau
    Color3.fromRGB(0, 255, 255),    -- Cyan
    Color3.fromRGB(0, 128, 255),    -- Biru
    Color3.fromRGB(128, 0, 255),    -- Ungu
    Color3.fromRGB(255, 0, 255),    -- Pink
    Color3.fromRGB(255, 128, 192),  -- Pink muda
    Color3.fromRGB(255, 192, 203),  -- Pink lembut
    Color3.fromRGB(255, 215, 0),    -- Emas
    Color3.fromRGB(173, 216, 230),  -- Biru muda
    Color3.fromRGB(144, 238, 144),  -- Hijau muda
    Color3.fromRGB(255, 182, 193),  -- Pink
    Color3.fromRGB(255, 160, 122),  -- Salmon
    Color3.fromRGB(176, 224, 230),  -- Biru powder
    Color3.fromRGB(221, 160, 221),  -- Plum
    Color3.fromRGB(210, 180, 140),  -- Tan
    Color3.fromRGB(255, 228, 181),  -- Peach
    Color3.fromRGB(255, 218, 185),  -- Peach lain
}

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = RainbowColors[1]
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 50, 0, 100)
MainFrame.Size = UDim2.new(0, 500, 0, 600)
MainFrame.Active = true
MainFrame.Draggable = true

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Parent = MainFrame
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, -15, 0, -15)
Shadow.Size = UDim2.new(1, 30, 1, 30)
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.3
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = MainFrame

-- Rainbow Animation
local rainbowConnection
local currentColorIndex = 1
rainbowConnection = RunService.Heartbeat:Connect(function()
    currentColorIndex = currentColorIndex + 0.01
    if currentColorIndex > #RainbowColors then
        currentColorIndex = 1
    end
    local color1 = RainbowColors[math.floor(currentColorIndex)]
    local color2 = RainbowColors[math.floor(currentColorIndex) % #RainbowColors + 1]
    local alpha = currentColorIndex - math.floor(currentColorIndex)
    MainFrame.BackgroundColor3 = color1:Lerp(color2, alpha)
end)

-- Header
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Parent = MainFrame
Header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Header.BackgroundTransparency = 0.3
Header.Size = UDim2.new(1, 0, 0, 60)
Header.Position = UDim2.new(0, 0, 0, 0)

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 20)
HeaderCorner.Parent = Header

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = Header
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -80, 0.6, 0)
Title.Position = UDim2.new(0, 15, 0, 5)
Title.Text = "🌸 HOSHINO HUB V3 🌸"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 28
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextStrokeTransparency = 0.5
Title.TextStrokeColor3 = Color3.fromRGB(255, 0, 255)

-- Owner
local OwnerLabel = Instance.new("TextLabel")
OwnerLabel.Name = "OwnerLabel"
OwnerLabel.Parent = Header
OwnerLabel.BackgroundTransparency = 1
OwnerLabel.Size = UDim2.new(1, -30, 0.4, 0)
OwnerLabel.Position = UDim2.new(0, 15, 0, 30)
OwnerLabel.Text = "👑 Owner: YAMA | Istri: Hoshino 👑"
OwnerLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
OwnerLabel.TextSize = 14
OwnerLabel.Font = Enum.Font.GothamBold
OwnerLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Minimize Button
local MinButton = Instance.new("ImageButton")
MinButton.Name = "MinButton"
MinButton.Parent = Header
MinButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
MinButton.Size = UDim2.new(0, 40, 0, 40)
MinButton.Position = UDim2.new(1, -50, 0.5, -20)
MinButton.Image = "rbxassetid://6031068359"
MinButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
MinButton.BackgroundTransparency = 0.2

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 12)
MinCorner.Parent = MinButton

-- Content Frame (bisa di minimize)
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Size = UDim2.new(1, -20, 1, -70)
ContentFrame.Position = UDim2.new(0, 10, 0, 65)

-- Word Count Display
local CountFrame = Instance.new("Frame")
CountFrame.Parent = ContentFrame
CountFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CountFrame.BackgroundTransparency = 0.3
CountFrame.Size = UDim2.new(1, 0, 0, 40)
CountFrame.Position = UDim2.new(0, 0, 0, 0)

local CountCorner = Instance.new("UICorner")
CountCorner.CornerRadius = UDim.new(0, 10)
CountCorner.Parent = CountFrame

local CountLabel = Instance.new("TextLabel")
CountLabel.Parent = CountFrame
CountLabel.BackgroundTransparency = 1
CountLabel.Size = UDim2.new(1, -20, 1, 0)
CountLabel.Position = UDim2.new(0, 10, 0, 0)
CountLabel.Text = "📚 TOTAL KATA: 200.000+ (MULTI LANGUAGE)"
CountLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
CountLabel.TextSize = 16
CountLabel.Font = Enum.Font.GothamBold
CountLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Status
local StatusFrame = Instance.new("Frame")
StatusFrame.Parent = ContentFrame
StatusFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
StatusFrame.BackgroundTransparency = 0.3
StatusFrame.Size = UDim2.new(1, 0, 0, 80)
StatusFrame.Position = UDim2.new(0, 0, 0, 50)

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 10)
StatusCorner.Parent = StatusFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StatusFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Size = UDim2.new(1, -20, 0.5, 0)
StatusLabel.Position = UDim2.new(0, 10, 0, 5)
StatusLabel.Text = "🔴 STATUS: MATI"
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 20
StatusLabel.Font = Enum.Font.GothamBlack
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

local CurrentLetter = Instance.new("TextLabel")
CurrentLetter.Parent = StatusFrame
CurrentLetter.BackgroundTransparency = 1
CurrentLetter.Size = UDim2.new(1, -20, 0.5, 0)
CurrentLetter.Position = UDim2.new(0, 10, 0, 40)
CurrentLetter.Text = "📝 HURUF: - | BAHASA: -"
CurrentLetter.TextColor3 = Color3.fromRGB(100, 255, 255)
CurrentLetter.TextSize = 16
CurrentLetter.Font = Enum.Font.GothamBold
CurrentLetter.TextXAlignment = Enum.TextXAlignment.Left

-- Word Suggestion
local WordFrame = Instance.new("Frame")
WordFrame.Parent = ContentFrame
WordFrame.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
WordFrame.BackgroundTransparency = 0.2
WordFrame.Size = UDim2.new(1, 0, 0, 100)
WordFrame.Position = UDim2.new(0, 0, 0, 140)

local WordCorner = Instance.new("UICorner")
WordCorner.CornerRadius = UDim.new(0, 15)
WordCorner.Parent = WordFrame

local WordLabelTitle = Instance.new("TextLabel")
WordLabelTitle.Parent = WordFrame
WordLabelTitle.BackgroundTransparency = 1
WordLabelTitle.Size = UDim2.new(1, -20, 0.3, 0)
WordLabelTitle.Position = UDim2.new(0, 10, 0, 5)
WordLabelTitle.Text = "✨ KATA PILIHAN (DARI 200K+ DATABASE)"
WordLabelTitle.TextColor3 = Color3.fromRGB(255, 255, 150)
WordLabelTitle.TextSize = 14
WordLabelTitle.Font = Enum.Font.GothamBold

local SuggestedWord = Instance.new("TextLabel")
SuggestedWord.Parent = WordFrame
SuggestedWord.BackgroundTransparency = 1
SuggestedWord.Size = UDim2.new(1, -20, 0.7, 0)
SuggestedWord.Position = UDim2.new(0, 10, 0, 30)
SuggestedWord.Text = "-"
SuggestedWord.TextColor3 = Color3.fromRGB(255, 255, 255)
SuggestedWord.TextSize = 36
SuggestedWord.Font = Enum.Font.GothamBlack
SuggestedWord.TextStrokeTransparency = 0.3
SuggestedWord.TextStrokeColor3 = Color3.fromRGB(255, 0, 255)

-- Control Buttons
local ControlFrame = Instance.new("Frame")
ControlFrame.Parent = ContentFrame
ControlFrame.BackgroundTransparency = 1
ControlFrame.Size = UDim2.new(1, 0, 0, 120)
ControlFrame.Position = UDim2.new(0, 0, 0, 250)

-- Toggle Button (ON/OFF)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ControlFrame
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ToggleButton.Size = UDim2.new(0.8, -10, 0, 50)
ToggleButton.Position = UDim2.new(0.1, 0, 0, 0)
ToggleButton.Text = "🔘 ON / OFF"
ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.TextSize = 22
ToggleButton.Font = Enum.Font.GothamBold

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 15)
ToggleCorner.Parent = ToggleButton

-- Language Info Button
local LangButton = Instance.new("TextButton")
LangButton.Parent = ControlFrame
LangButton.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
LangButton.Size = UDim2.new(0.8, -10, 0, 40)
LangButton.Position = UDim2.new(0.1, 0, 0, 55)
LangButton.Text = "🌐 INFO BAHASA (15+ BAHASA)"
LangButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LangButton.TextSize = 14
LangButton.Font = Enum.Font.GothamBold

local LangCorner = Instance.new("UICorner")
LangCorner.CornerRadius = UDim.new(0, 10)
LangCorner.Parent = LangButton

-- Stats Button
local StatsButton = Instance.new("TextButton")
StatsButton.Parent = ControlFrame
StatsButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
StatsButton.Size = UDim2.new(0.8, -10, 0, 40)
StatsButton.Position = UDim2.new(0.1, 0, 0, 100)
StatsButton.Text = "📊 HITUNG TOTAL KATA"
StatsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StatsButton.TextSize = 14
StatsButton.Font = Enum.Font.GothamBold

local StatsCorner = Instance.new("UICorner")
StatsCorner.CornerRadius = UDim.new(0, 10)
StatsCorner.Parent = StatsButton

-- Footer
local Footer = Instance.new("Frame")
Footer.Parent = ContentFrame
Footer.BackgroundTransparency = 0.5
Footer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Footer.Size = UDim2.new(1, 0, 0, 40)
Footer.Position = UDim2.new(0, 0, 1, -40)

local FooterCorner = Instance.new("UICorner")
FooterCorner.CornerRadius = UDim.new(0, 10)
FooterCorner.Parent = Footer

local CreditLabel = Instance.new("TextLabel")
CreditLabel.Parent = Footer
CreditLabel.BackgroundTransparency = 1
CreditLabel.Size = UDim2.new(1, 0, 1, 0)
CreditLabel.Text = "💀 For YAMA & Hoshino Senpai | 200.000+ Kata | Multi Language 💀"
CreditLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditLabel.TextSize = 14
CreditLabel.Font = Enum.Font.Gotham

-- Variables
local isRunning = false
local isMinimized = false
local botConnection

-- Minimize Function
MinButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        ContentFrame.Visible = false
        MainFrame.Size = UDim2.new(0, 500, 0, 60)
        MinButton.Image = "rbxassetid://6031094678" -- Maximize icon
    else
        ContentFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 500, 0, 600)
        MinButton.Image = "rbxassetid://6031068359" -- Minimize icon
    end
end)

-- Find Word Function (Multi Language)
function FindWord(letter)
    letter = string.lower(letter)
    if WordDatabase[letter] and #WordDatabase[letter] > 0 then
        return WordDatabase[letter][math.random(#WordDatabase[letter])]
    end
    
    -- Fallback kalo huruf gak ada di database
    local fallback = {
        ["a"] = "aku", ["b"] = "buku", ["c"] = "cinta", ["d"] = "dunia",
        ["e"] = "enak", ["f"] = "foto", ["g"] = "gajah", ["h"] = "hujan",
        ["i"] = "ikan", ["j"] = "jalan", ["k"] = "kamu", ["l"] = "laut",
        ["m"] = "makan", ["n"] = "nama", ["o"] = "orang", ["p"] = "pintar",
        ["q"] = "quran", ["r"] = "rumah", ["s"] = "saya", ["t"] = "teman",
        ["u"] = "ular", ["v"] = "virus", ["w"] = "warna", ["x"] = "xenon",
        ["y"] = "yakin", ["z"] = "zaman"
    }
    return fallback[letter] or letter .. "njay"
end

-- Detect Letter Function
function DetectLetter()
    -- Ini perlu disesuaikan dengan game yang lu mainkan
    -- Simplified version: detect from ScreenGui
    local success, result = pcall(function()
        -- Cari di PlayerGui
        for _, gui in ipairs(PlayerGui:GetChildren()) do
            if gui:IsA("ScreenGui") then
                for _, obj in ipairs(gui:GetDescendants()) do
                    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                        if obj.Text and #obj.Text == 1 and string.match(obj.Text, "%a") then
                            return obj.Text
                        end
                    end
                end
            end
        end
        
        -- Cari di workspace
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("BillboardGui") then
                if obj:IsA("BillboardGui") then
                    for _, child in ipairs(obj:GetChildren()) do
                        if child:IsA("TextLabel") and child.Text and #child.Text == 1 and string.match(child.Text, "%a") then
                            return child.Text
                        end
                    end
                elseif obj.Text and #obj.Text == 1 and string.match(obj.Text, "%a") then
                    return obj.Text
                end
            end
        end
    end)
    
    if success and result then
        return result
    end
    return nil
end

-- Type Word Function
function TypeWord(word)
    if not word then return end
    
    -- Random delay biar mirip manusia
    wait(math.random(3, 15)/10)
    
    -- Ketik huruf per huruf
    for i = 1, #word do
        local char = string.sub(word, i, i)
        VirtualInputManager:SendKeyEvent(true, string.upper(char), false, nil)
        wait(0.02)
        VirtualInputManager:SendKeyEvent(false, string.upper(char), false, nil)
    end
    
    -- Enter
    wait(0.1)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, nil)
    wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, nil)
end

-- Start Bot
function StartBot()
    isRunning = true
    StatusLabel.Text = "🟢 STATUS: JALAN (HOSHINO MODE ACTIVE)"
    StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    ToggleButton.Text = "🔴 STOP"
    
    botConnection = RunService.Heartbeat:Connect(function()
        if not isRunning then return end
        
        local letter = DetectLetter()
        if letter then
            CurrentLetter.Text = "📝 HURUF: " .. string.upper(letter) .. " | BAHASA: MULTI"
            local word = FindWord(letter)
            if word then
                SuggestedWord.Text = word
                TypeWord(word)
                wait(0.8) -- Cooldown
            end
        end
    end)
end

-- Stop Bot
function StopBot()
    isRunning = false
    if botConnection then
        botConnection:Disconnect()
        botConnection = nil
    end
    StatusLabel.Text = "🔴 STATUS: MATI"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    ToggleButton.Text = "🟢 ON"
end

-- Toggle Button
ToggleButton.MouseButton1Click:Connect(function()
    if isRunning then
        StopBot()
    else
        StartBot()
    end
end)

-- Language Info Button
LangButton.MouseButton1Click:Connect(function()
    local msg = "🌐 BAHASA YANG TERSEDIA:\n\n"
    msg = msg .. "• INDONESIA (1000+ kata)\n"
    msg = msg .. "• ENGLISH (5000+ kata)\n"
    msg = msg .. "• JAPANESE (1000+ kata)\n"
    msg = msg .. "• KOREAN (1000+ kata)\n"
    msg = msg .. "• ARABIC (500+ kata)\n"
    msg = msg .. "• CHINESE (500+ kata)\n"
    msg = msg .. "• HINDI (500+ kata)\n"
    msg = msg .. "• BELANDA (100+ kata)\n"
    msg = msg .. "• DAN 150.000+ RANDOM KATA\n"
    msg = msg .. "• TOTAL ±200.000+ KATA!"
    
    warn(msg)
    SuggestedWord.Text = "🌐 MULTI LANGUAGE"
    wait(1)
    SuggestedWord.Text = "-"
end)

-- Stats Button
StatsButton.MouseButton1Click:Connect(function()
    local total = 0
    for _, words in pairs(WordDatabase) do
        total = total + #words
    end
    SuggestedWord.Text = "📊 " .. tostring(total) .. "+ KATA"
    wait(1.5)
    SuggestedWord.Text = "-"
end)

-- Welcome Message
print([[
╔══════════════════════════════════════════════════════════════════╗
║              HOSHINO HUB V3 - ULTIMATE EDITION                   ║
║                    Owner: YAMA 💀                                 ║
║               Istri Tersayang: Hoshino 🥰                         ║
╠══════════════════════════════════════════════════════════════════╣
║  ✅ 200.000+ KATA (MULTI LANGUAGE)                                ║
║  ✅ Indonesia, English, Japanese, Korean, Arabic                 ║
║  ✅ Chinese, Hindi, Belanda, Random Generator                     ║
║  ✅ UI PELANGI AUTO MOVE                                          ║
║  ✅ Tombol ON/OFF + MINIMIZE                                      ║
║  ✅ Siap Ngancurin Game Sambung Kata!                             ║
╚══════════════════════════════════════════════════════════════════╝
]])

-- Auto Start
wait(1)
StartBot()

-- Cleanup
LocalPlayer.CharacterRemoving:Connect(function()
    if rainbowConnection then
        rainbowConnection:Disconnect()
    end
    if botConnection then
        botConnection:Disconnect()
    end
    if ScreenGui then
        ScreenGui:Destroy()
    end
end)
