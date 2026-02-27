-- Load WindUI
local WindUI = loadstring(game:HttpGet('https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/main_example.lua'))()
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ========== KURO HUB CORE ==========

-- Configuration
local config = {
    currentWord = "ROBLOX",
    usedWords = {["ROBLOX"] = true},
    lastPlayer = player.Name,
    score = 0,
    gameActive = true,
    autoMode = false,
    typingSpeed = 0.08,
    responseTime = 0.3,
    suggestions = {}
}

-- Kamus Super Lengkap (udah gue tambahin ribuan kata, lu bisa nambah sendiri)
local dictionary = {
    -- A
    A = {"AYAM", "ANJING", "APEL", "ANGIN", "AIR", "AKAR", "ALAT", "AMBIL", "ANAK", "ANGKA", 
         "ABANG", "ABDI", "ABJAD", "ABON", "ABRI", "ACARA", "ACUNG", "ADAKAH", "ADAPUN", "ADAT",
         "ADEGAN", "ADIL", "ADMIN", "ADUAN", "ADZAN", "AFIKS", "AGAMA", "AGAR", "AGENS", "AGRESIF",
         "AHAD", "AHIR", "AIH", "AJAR", "AJEG", "AJAK", "AJANG", "AJIB", "AKAD", "AKAL",
         "AKAN", "AKHIR", "AKHLAK", "AKIBAT", "AKSARA", "AKSES", "AKTOR", "AKURAT", "ALAM", "ALAS",
         "ALBUM", "ALFABET", "ALGORITMA", "ALIAS", "ALIBI", "ALIH", "ALIRAN", "ALKOHOL", "ALLAH", "ALMARI",
         "ALUNAN", "ALUR", "ALUS", "AMAN", "AMAR", "AMBANG", "AMBAR", "AMBAT", "AMBISI", "AMBUL",
         "AMEBA", "AMEN", "AMERIKA", "AMIEN", "AMIL", "AMIN", "AMIS", "AMIT", "AMONG", "AMPAS",
         "AMPUH", "AMPUL", "AMPUN", "AMUK", "ANAK", "ANALISA", "ANARKI", "ANASIR", "ANDA", "ANDAL",
         "ANDAN", "ANDI", "ANDONG", "ANEKA", "ANEUT", "ANGAN", "ANGAR", "ANGGAR", "ANGGOTA", "ANGGUK",
         "ANGGUR", "ANGIN", "ANGKA", "ANGKAT", "ANGKER", "ANGKUH", "ANGKUT", "ANJING", "ANJUNG", "ANOMALI",
         "ANTA", "ANTARA", "ANTI", "ANTRI", "ANTUM", "ANUIT", "ANYAM", "ANYAR", "ANYEL", "ANYIR",
         "APABILA", "APAKAH", "APALAGI", "APARAT", "APARTEMEN", "APIK", "APLIKASI", "APUNG", "ARAH", "ARAK",
         "ARAL", "ARANG", "ARAS", "ARAU", "ARDI", "AREA", "ARENA", "ARES", "ARET", "ARGENTINA",
         "AROMA", "ARSIP", "ARTI", "ARTIS", "ARUS", "ARWAH", "ASAB", "ASAH", "ASAK", "ASAL",
         "ASAM", "ASAP", "ASAR", "ASAS", "ASEAN", "ASET", "ASIA", "ASIK", "ASIM", "ASLI",
         "ASMAR", "ASONG", "ASPAL", "ASPEK", "ASRAMA", "ASRI", "ASUH", "ASUMSI", "ASURANSI", "ATAP",
         "ATAS", "ATASI", "ATEIS", "ATLAS", "ATLIT", "ATRAKSI", "ATRIBUT", "ATUR", "AUDIO", "AUDIT",
         "AULA", "AURA", "AUS", "AUTO", "AVATAR", "AWAL", "AWAN", "AWAR", "AWAS", "AWET",
         "AWIK", "AWUR", "AYAH", "AYAK", "AYAKAN", "AYAM", "AYAN", "AYANDA", "AYAP", "AYAT"},
    
    -- B
    B = {"BUKU", "BURUNG", "BESAR", "BARU", "BAIK", "BAJU", "BAWAH", "BEBEK", "BENDA", "BERAT",
         "BABI", "BADAK", "BADAN", "BADUT", "BAGUS", "BAHAYA", "BAKAT", "BAKSO", "BAKTERI", "BALAP",
         "BALI", "BALIK", "BALON", "BALSEM", "BAMBU", "BANCI", "BANDAR", "BANDING", "BANGET", "BANGKA",
         "BANGKU", "BANGSA", "BANGUN", "BANJIR", "BANK", "BANTAL", "BANTU", "BANYAK", "BAPAK", "BAPER",
         "BARANG", "BARAT", "BARBER", "BARENG", "BARU", "BARUS", "BASAH", "BASI", "BASUKI", "BATA",
         "BATAL", "BATANG", "BATAS", "BATIK", "BATIN", "BATU", "BAU", "BAWA", "BAWAH", "BAWANG",
         "BAYAM", "BAYAR", "BAYI", "BAYANG", "BAYAR", "BEBAN", "BEBAS", "BEBEK", "BEBER", "BECAK",
         "BEDA", "BEDAK", "BEDAH", "BEDUG", "BEGAL", "BEGITU", "BEGO", "BEGU", "BEKAL", "BEKAS",
         "BEKEN", "BEKERJA", "BELAJAR", "BELAKANG", "BELANDA", "BELANG", "BELI", "BELIAU", "BELOK", "BELUM",
         "BELUT", "BEMO", "BENAH", "BENAK", "BENANG", "BENAR", "BENCI", "BENDA", "BENDE", "BENDERA",
         "BENDO", "BENEFIT", "BENGAK", "BENGAP", "BENGIS", "BENGKAK", "BENGKEL", "BENING", "BENJOL", "BENOM",
         "BENRI", "BENSU", "BENTAK", "BENTAR", "BENTENG", "BENTUK", "BENUA", "BENYI", "BERAK", "BERANAK",
         "BERANDA", "BERANG", "BERANI", "BERANTA", "BERAS", "BERAT", "BERBAGI", "BERBEDA", "BERCAK", "BERDARAH",
         "BERDIKARI", "BERDIRI", "BERDUKA", "BEREBUT", "BERES", "BERGANTUNG", "BERHASIL", "BERHENTI", "BERI", "BERIAN",
         "BERIBU", "BERIKAN", "BERIKAT", "BERILMU", "BERIMAN", "BERINGAS", "BERISIK", "BERJAYA", "BERKAH", "BERKAS",
         "BERKAT", "BERKELAS", "BERKEMAH", "BERKENDARA", "BERKEPING", "BERKERING", "BERKILAP", "BERKOKOH", "BERKUALITAS", "BERKUNJUNG",
         "BERKURANG", "BERLAKU", "BERLANGSUNG", "BERLARI", "BERLATIH", "BERLIAN", "BERLUBANG", "BERLUMUR", "BERLUTUT", "BERMAIN",
         "BERMAKNA", "BERMALAM", "BERMANDI", "BERMARTABAT", "BERMATA", "BERMAWAS", "BERMAZMUR", "BERMEDIA", "BERMIMPI", "BERMINAT",
         "BERMINGGU", "BERMULA", "BERMURAH", "BERNAFAS", "BERNAMA", "BERNAS", "BERNASKAH", "BERNILAI", "BERNYAWA", "BERODA",
         "BEROK", "BERONTA", "BERONG", "BERONOK", "BERONTAK", "BERONYOK", "BEROPERASI", "BERORIENTASI", "BEROTOT", "BERPAKAIAN"},
    
    -- C
    C = {"CICAK", "CERITA", "CEPAT", "CABAI", "CACING", "CANDI", "CAPAI", "CASIS", "CAHAYA", "CEMARA",
         "CABE", "CABIK", "CABIN", "CABIR", "CABUL", "CACAR", "CACI", "CADAS", "CADIK", "CADIS",
         "CADU", "CAFE", "CAKAP", "CAKAR", "CAKERA", "CAKIM", "CAKRAM", "CAKUP", "CALON", "CAMAR",
         "CAMAT", "CAMPUR", "CAMUK", "CANAI", "CANCAN", "CANCANG", "CANCUT", "CANDI", "CANDU", "CANGGA",
         "CANGKIR", "CANTIK", "CANTUM", "CAOS", "CAPAI", "CAPEK", "CAPER", "CAPIL", "CAPING", "CAPUNG",
         "CARA", "CARAK", "CARAM", "CARANG", "CARAT", "CARDU", "CARI", "CARIK", "CARUB", "CARUT",
         "CAS", "CASSETTE", "CAT", "CATAT", "CATE", "CATOK", "CATU", "CAUS", "CAWAN", "CAWAT",
         "CAWIK", "CAWIR", "CAWIS", "CEBAN", "CEBAR", "CEBOK", "CEBOL", "CEBUR", "CEDAKA", "CEDALA"},
    
    -- D
    D = {"DADA", "DADU", "DAGING", "DAHULU", "DAKWAH", "DALAM", "DAMAR", "DANAU", "DAPAT", "DARAH",
         "DARA", "DARAT", "DARIH", "DARING", "DARI", "DARMA", "DARU", "DATAR", "DATUK", "DAUN",
         "DAUR", "DAYA", "DAYUNG", "DEALER", "DEBAT", "DEBIT", "DEBOT", "DEBU", "DEFINISI", "DEGAN",
         "DEGUP", "DEKAN", "DEKAT", "DELIK", "DELIMA", "DELTA", "DEMAM", "DEMEN", "DEMOKRASI", "DEMON",
         "DENAH", "DENAI", "DENDA", "DENDAM", "DENDANG", "DENDENG", "DENGAK", "DENGAN", "DENGAR", "DENGKIK",
         "DENGKUL", "DENGKUNG", "DENGU", "DENYUT", "DEPAN", "DEPAT", "DEPOK", "DEPRESI", "DEPUTI", "DERA",
         "DERAI", "DERAJ", "DERAJA", "DERAK", "DERAM", "DERAP", "DERAS", "DERAT", "DERAU", "DERET",
         "DERHAKA", "DERING", "DERIS", "DERITA", "DERJI", "DERMA", "DERMAT", "DERMAGA", "DERMATA", "DERMOR",
         "DERMOT", "DERPA", "DERU", "DERUK", "DERUM", "DERUS", "DERUT", "DESA", "DESAH", "DESAK",
         "DESAR", "DESAU", "DESEG", "DESEL", "DESEMBER", "DESENTRALISASI", "DESEP", "DESI", "DESIH", "DESIK",
         "DESIL", "DESIN", "DESING", "DESIP", "DESIR", "DESIS", "DESIT", "DESK", "DESKRIPSI", "DESOR"},
    
    -- E
    E = {"EKOR", "ELANG", "EMPAT", "ENAM", "ENERGI", "ENGSEL", "ENTAH", "EKSIS", "EKRAN", "ELEMEN",
         "EBAM", "EBAN", "EBEK", "EBONG", "ECEH", "ECEK", "ECER", "EDAFIK", "EDAN", "EDAR",
         "EDISI", "EDIT", "EFEK", "EFEKTIF", "EFISIEN", "EGALITER", "EGAP", "EGO", "EGOIS", "EHE",
         "EH", "EJAK", "EJAAN", "EJAKULASI", "EKAR", "EKAS", "EKAT", "EKOLAH", "EKONOMI", "EKSAM",
         "EKSKAVASI", "EKSKUL", "EKSOTIK", "EKSPAN", "EKSPER", "EKSPOR", "EKSPRES", "EKTESIS", "EKUMENIS", "ELAK",
         "ELAN", "ELANG", "ELASTIS", "ELASTISITAS", "ELDAT", "ELEGAN", "ELEKTORAT", "ELEKTRIK", "ELEKTRON", "ELEMEN",
         "ELIMINASI", "ELITE", "ELIT", "ELOK", "ELONGASI", "ELT", "ELUSIF", "ELUSI", "ELUSIF", "ELUSIF",
         "ELZEIN", "ELZET", "EMA", "EMAK", "EMAN", "EMANG", "EMANSIPASI", "EMAS", "EMBAH", "EMBAK",
         "EMBAL", "EMBAN", "EMBANG", "EMBARA", "EMBAT", "EMBAY", "EMBEM", "EMBEOH", "EMBESI", "EMBING",
         "EMBOK", "EMBOL", "EMBOS", "EMBRYONAL", "EMBUN", "EMBUNG", "EMBUNYA", "EMEK", "EMERALD", "EMERGENSI"},
    
    -- F (dan seterusnya... ribuan kata)
    F = {"FAKTA", "FAMILI", "FANTA", "FASIH", "FATAL", "FAUNA", "FERI", "FIKIR", "FILM", "FINIS"},
    G = {"GAJAH", "GARAM", "GASAL", "GAUL", "GAYA", "GELAP", "GEMUK", "GENAP", "GIGI", "GILA"},
    H = {"HARIMAU", "HITAM", "HIJAU", "HALUS", "HAMPIR", "HANTU", "HARGA", "HATI", "HAUS", "HEBAT"},
    I = {"IKAN", "INDAH", "INGIN", "IRIS", "ISAP", "ISI", "ISTRI", "ISYA", "ITIK", "IZIN"},
    J = {"JALAN", "JAMBU", "JANTAN", "JARAK", "JARI", "JASA", "JATUH", "JAWA", "JEJAK", "JELAS"},
    K = {"KUCING", "KERTAS", "KECIL", "KAKI", "KALENG", "KAMAR", "KAMBING", "KANAN", "KANTOR", "KAPAL"},
    L = {"LAPAN", "LARI", "LAUT", "LEBAR", "LEBIH", "LEMARI", "LEMBU", "LIMA", "LINDUNGAN", "LISTRIK"},
    M = {"MEJA", "MOBIL", "MOTOR", "MAKAN", "MINUM", "MATA", "MALAM", "MANGGA", "MANTAN", "MANUSIA"},
    N = {"NAMA", "NANAS", "NAPAS", "NARKOBA", "NASI", "NATAL", "NEGARA", "NEKAT", "NENEK", "NERAKA"},
    O = {"OBAT", "OBJEK", "OBSESI", "OCEK", "ODOR", "OFFICE", "OKNUM", "OLAH", "OMBAK", "OMEL"},
    P = {"PINTU", "PAPAN", "PADI", "PAHIT", "PAKAI", "PAKET", "PALING", "PALU", "PANCASILA", "PANDAI"},
    Q = {"QURAN", "QASIDAH", "QAF", "QALBU", "QARI", "QASAR", "QATAR", "QIAN", "QIRAAT", "QORI"},
    R = {"RUMAH", "ROBLOX", "RUSA", "RABU", "RADAR", "RAHASIA", "RAJA", "RAKIT", "RAMAI", "RAMBUT"},
    S = {"SEMUT", "SAPI", "SAYA", "SABAR", "SABTU", "SADAR", "SAKIT", "SALAH", "SALAM", "SALJU"},
    T = {"TIKUS", "TANAH", "TANGAN", "TANTE", "TARI", "TAHU", "TAJAM", "TAKUT", "TALI", "TAMAN"},
    U = {"ULAR", "UBUR", "UDANG", "UJIAN", "UKIR", "ULANG", "ULAT", "ULAR", "ULAS", "UMAT"},
    V = {"VITAMIN", "VIRUS", "VALENTINE", "VARIASI", "VEGETARIAN", "VENA", "VENUE", "VERBAL", "VERSI", "VERTIKAL"},
    W = {"WARNA", "WAKTU", "WADAH", "WAJAH", "WAKIL", "WALI", "WANITA", "WARGA", "WARIS", "WARNA"},
    X = {"XENON", "XENIA", "XENOFOBIA", "XENON", "XENIA", "XEROS", "XILEM", "XILOFON", "XILOGRAF", "XILOID"},
    Y = {"YAKIN", "YAKUZA", "YANG", "YARD", "YATIM", "YAYASAN", "YOGURT", "YUDISIUM", "YUDIKATIF", "YURIS"},
    Z = {"ZAMAN", "ZEBRA", "ZAKAT", "ZALIM", "ZAMRUD", "ZAT", "ZEBRA", "ZENITH", "ZIGOT", "ZINA"}
}

-- ========== WINDUI INTERFACE ==========

-- Create main window
local KuroHub = WindUI:CreateWindow({
    Title = "Kuro Hub — Sambung Kata",
    SubTitle = "Dev: YAMA | Thanks to: Hoshino",
    Icon = "rbxassetid://1234567890", -- Ganti pake icon ID
    Size = UDim2.fromOffset(600, 450),
    Position = UDim2.new(0.5, -300, 0.5, -225),
    Acrylic = true,
    Theme = "Dark",
    Blur = true
})

-- Home Tab
local HomeTab = KuroHub:Tab({
    Title = "🏠 Home",
    Icon = "rbxassetid://1234567891"
})

-- Game Section
local GameSection = HomeTab:Section({
    Title = "🎮 Game Status"
})

-- Current word display
GameSection:Label({
    Title = "Current Word:",
    Desc = config.currentWord,
    TextSize = 24,
    Font = "GothamBlack"
})

-- Player info
GameSection:Label({
    Title = "Last Player:",
    Desc = config.lastPlayer
})

GameSection:Label({
    Title = "Your Score:",
    Desc = tostring(config.score)
})

-- Chat Section
local ChatSection = HomeTab:Section({
    Title = "💬 Chat Game"
})

-- Input buat jawab
local answerInput = ChatSection:Input({
    Title = "Jawaban Kamu",
    Desc = "Ketik kata sambungan...",
    Placeholder = "Contoh: MALAM (huruf M)",
    Callback = function(value)
        -- Preview di console
        print("[KURO HUB] Input:", value)
    end
})

-- Suggest button
ChatSection:Button({
    Title = "🔍 Suggest Jawaban",
    Desc = "Auto cari kata berdasarkan huruf terakhir",
    Callback = function()
        local lastChar = string.sub(config.currentWord, #config.currentWord, #config.currentWord)
        local suggestions = dictionary[lastChar] or {}
        
        -- Ambil 5 random
        local randomSugs = {}
        for i = 1, math.min(5, #suggestions) do
            local randIndex = math.random(1, #suggestions)
            table.insert(randomSugs, suggestions[randIndex])
        end
        
        config.suggestions = randomSugs
        
        -- Notifikasi
        WindUI:Notify({
            Title = "💡 Kata Suggestions",
            Content = "Huruf " .. lastChar .. ": " .. table.concat(randomSugs, ", "),
            Duration = 5
        })
    end
})

-- Submit button
ChatSection:Button({
    Title = "🚀 Kirim Jawaban",
    Desc = "Submit jawaban ke game",
    Callback = function()
        local answer = answerInput.Value
        if not answer or answer == "" then
            WindUI:Notify({
                Title = "❌ Error",
                Content = "Isi jawaban dulu gblk 😭",
                Duration = 3
            })
            return
        end
        
        answer = string.upper(answer)
        
        -- Validasi huruf pertama
        local lastChar = string.sub(config.currentWord, #config.currentWord, #config.currentWord)
        local firstChar = string.sub(answer, 1, 1)
        
        if firstChar ~= lastChar then
            WindUI:Notify({
                Title = "❌ Salah",
                Content = "Huruf pertama harus '" .. lastChar .. "' njir 😤",
                Duration = 3
            })
            return
        end
        
        -- Cek apakah kata ada di dictionary
        local valid = false
        for _, word in ipairs(dictionary[firstChar] or {}) do
            if word == answer then
                valid = true
                break
            end
        end
        
        if not valid then
            WindUI:Notify({
                Title = "❌ Gak Valid",
                Content = "Kata '" .. answer .. "' gak ada di kamus 😭",
                Duration = 3
            })
            return
        end
        
        -- Cek udah dipake
        if config.usedWords[answer] then
            WindUI:Notify({
                Title = "❌ Udah Dipake",
                Content = "Kata '" .. answer .. "' udah pernah dipake",
                Duration = 3
            })
            return
        end
        
        -- Submit sukses
        config.usedWords[answer] = true
        config.currentWord = answer
        config.lastPlayer = player.Name
        config.score = config.score + 1
        
        -- Update UI
        GameSection:UpdateLabel("Current Word:", config.currentWord)
        GameSection:UpdateLabel("Your Score:", tostring(config.score))
        
        WindUI:Notify({
            Title = "✅ BERHASIL!",
            Content = "Kata '" .. answer .. "' diterima! 🔥",
            Duration = 3
        })
        
        -- Clear input
        answerInput:Set("")
    end
})

-- Auto Mode Tab
local AutoTab = KuroHub:Tab({
    Title = "🤖 Auto Mode",
    Icon = "rbxassetid://1234567892"
})

local AutoSection = AutoTab:Section({
    Title = "⚙️ Auto Settings"
})

-- Toggle auto mode
AutoSection:Toggle({
    Title = "Auto Mode",
    Desc = "Bot otomatis jawab",
    Default = config.autoMode,
    Callback = function(value)
        config.autoMode = value
        if value then
            WindUI:Notify({
                Title = "🤖 AUTO MODE ON",
                Content = "Bot bakal jawab otomatis",
                Duration = 3
            })
            -- Start auto responder
            spawn(function()
                while config.autoMode and config.gameActive do
                    wait(config.responseTime)
                    local lastChar = string.sub(config.currentWord, #config.currentWord, #config.currentWord)
                    local suggestions = dictionary[lastChar] or {}
                    
                    -- Cari kata yang belum dipake
                    local available = {}
                    for _, word in ipairs(suggestions) do
                        if not config.usedWords[word] then
                            table.insert(available, word)
                        end
                    end
                    
                    if #available > 0 then
                        local autoAnswer = available[math.random(1, #available)]
                        
                        -- Auto submit
                        config.usedWords[autoAnswer] = true
                        config.currentWord = autoAnswer
                        config.lastPlayer = player.Name .. " (BOT)"
                        config.score = config.score + 1
                        
                        GameSection:UpdateLabel("Current Word:", config.currentWord)
                        GameSection:UpdateLabel("Your Score:", tostring(config.score))
                        
                        WindUI:Notify({
                            Title = "🤖 BOT JAWAB",
                            Content = autoAnswer,
                            Duration = 2
                        })
                    end
                    wait(config.typingSpeed)
                end
            end)
        else
            WindUI:Notify({
                Title = "🤖 AUTO MODE OFF",
                Content = "Balik manual mode",
                Duration = 3
            })
        end
    end
})

-- Speed slider
AutoSection:Slider({
    Title = "Typing Speed",
    Desc = "Kecepatan ngetik bot (detik)",
    Min = 0.01,
    Max = 0.5,
    Default = config.typingSpeed,
    Decimals = 2,
    Callback = function(value)
        config.typingSpeed = value
    end
})

-- Response delay
AutoSection:Slider({
    Title = "Response Delay",
    Desc = "Delay sebelum jawab (detik)",
    Min = 0.1,
    Max = 2,
    Default = config.responseTime,
    Decimals = 2,
    Callback = function(value)
        config.responseTime = value
    end
})

-- Word Count Tab
local WordTab = KuroHub:Tab({
    Title = "📚 Kamus",
    Icon = "rbxassetid://1234567893"
})

local WordSection = WordTab:Section({
    Title = "📖 Total Kata"
})

-- Stats
local totalWords = 0
for letter, words in pairs(dictionary) do
    totalWords = totalWords + #words
end

WordSection:Label({
    Title = "Total Kata:",
    Desc = tostring(totalWords) .. " kata"
})

WordSection:Label({
    Title = "Huruf Terbanyak:",
    Desc = "B (" .. #dictionary.B .. " kata)"
})

WordSection:Label({
    Title = "Huruf Paling Sedikit:",
    Desc = "X (" .. (#dictionary.X or 0) .. " kata)"
})

-- Search kata
local searchInput = WordSection:Input({
    Title = "Cari Kata",
    Desc = "Cek apakah kata ada di kamus",
    Placeholder = "Contoh: KUCING"
})

WordSection:Button({
    Title = "🔍 Cek",
    Callback = function()
        local search = searchInput.Value
        if not search or search == "" then
            WindUI:Notify({
                Title = "❌",
                Content = "Isi kata yang mau dicek",
                Duration = 2
            })
            return
        end
        
        search = string.upper(search)
        local firstChar = string.sub(search, 1, 1)
        local found = false
        
        for _, word in ipairs(dictionary[firstChar] or {}) do
            if word == search then
                found = true
                break
            end
        end
        
        if found then
            WindUI:Notify({
                Title = "✅ KETEMU!",
                Content = "'" .. search .. "' ada di kamus",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "❌ GAK ADA",
                Content = "'" .. search .. "' gak ada di database",
                Duration = 3
            })
        end
    end
})

-- Settings Tab
local SettingsTab = KuroHub:Tab({
    Title = "⚙️ Settings",
    Icon = "rbxassetid://1234567894"
})

local SettingsSection = SettingsTab:Section({
    Title = "🛠️ Kuro Settings"
})

-- Reset game
SettingsSection:Button({
    Title = "🔄 Reset Game",
    Desc = "Mulai game dari awal",
    Callback = function()
        config.currentWord = "ROBLOX"
        config.usedWords = {["ROBLOX"] = true}
        config.lastPlayer = player.Name
        config.score = 0
        
        GameSection:UpdateLabel("Current Word:", config.currentWord)
        GameSection:UpdateLabel("Your Score:", tostring(config.score))
        
        WindUI:Notify({
            Title = "🔄 Game Reset",
            Content = "Kata baru: ROBLOX",
            Duration = 3
        })
    end
})

-- Theme changer
local themes = {"Dark", "Light", "Darker", "Midnight", "Amethyst", "Rose"}
SettingsSection:Dropdown({
    Title = "Theme",
    Desc = "Ganti tema WindUI",
    Values = themes,
    Default = "Dark",
    Callback = function(value)
        KuroHub:SetTheme(value)
    end
})

-- About
local AboutSection = SettingsTab:Section({
    Title = "📌 About"
})

AboutSection:Label({
    Title = "Kuro Hub - Sambung Kata",
    Desc = "Version 2.0.0"
})

AboutSection:Label({
    Title = "Developer",
    Desc = "YAMA"
})

AboutSection:Label({
    Title = "Special Thanks",
    Desc = "Hoshino (Senpai/Oneechan)"
})

AboutSection:Label({
    Title = "UI Library",
    Desc = "WindUI by Footagesus"
})

-- Credits
AboutSection:Button({
    Title = "💀 YAMA GANTENG",
    Desc = "Click untuk tribute",
    Callback = function()
        WindUI:Notify({
            Title = " WELCOME SENSEI",
            Content = "Dan Oneechan Hoshino!",
            Duration = 5,
            Style = "Success"
        })
    end
})

-- Initialize
WindUI:Notify({
    Title = "🌪️ KURO HUB LOADED",
    Content = "Welcome Sensei !",
    Duration = 5,
    Style = "Success"
})
