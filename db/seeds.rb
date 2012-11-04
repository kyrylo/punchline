# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pm_bio =<<BIO
Рэп-ансамбль эпохи постмодерна.

Творчество группы не несет в себе пропаганды каких-либо идей и призывов к
противоправным действиям, а является всего лишь творческим актом. Авторы просят
воспринимать его исключительно в этом качестве. Все совпадения случайны. Мнения
авторов могут не совпадать с их точкой зрения.
BIO
pm = Artist.create!(name: 'Проект Увечье', bio: pm_bio, rap_group: true)
pm.aliases.create!(name: 'ПУ')

ox_bio =<<BIO
Родился в 1985 в Ленинграде. Отец - физик-теоретик, мать - библиотекарь. В
девять лет уезжает в Германию вместе с семьей, не способной прокормить себя в
эпоху первоначального накопления капитала. Бывший экстраверт и любимчик класса
оказывается «Чучелом», жертвой систематического моббинга среди детей зажиточных
немецких бюргеров, становится нелюдим и асоциален. Мирон уходит в себя, в книги,
и, что менее предсказуемо для домашнего мальчика - в рэп, позволяющий отвлечься
от семейного безденежья и тоски по дому.

Впоследствии, уже в Англии, куда семью занесет повторная эмиграция, это раннее
книжное затворничество вкупе с наглостью поможет подростку без связей и блата
поступить в Оксфордский университет, но от кастового разделения не спасет. Вновь
не вписавшись в мир аристократов и сильных мира сего, Мирон из упрямства
получает диплом по одной из самых диковинных специальностей — «средневековая
английская литература», а в нагрузку зарабатывает еще одну корочку — с диагнозом
«маниакальная депрессия».

Подрабатывая кассиром, переводчиком, пионервожатым, грузчиком, гидом,
ларечником, репетитором, офисным работником и конферансье, Мирон в то же время
все чаще обращается к рэпу. Детское увлечение, начавшееся в 13 лет с записи на
кассетник и баттлов во дворах, постепенно становится смыслом существования.

Но поставленная цель требует жертв. Кочевой образ жизни по друзьям и
немеблированным квартирам делает отрегулированный быт невозможным. Распадается
ранний брак с любовью юности. Обрывается и еще одна загадочная глава биографии —
работа в компании, устраивающей детей российской элиты в британские частные
школы. Опыт попоек с миллиардерами и вызволения их отпрысков из участка в 3
утра, когда сам не можешь свести концы с концами, лишь сильнее обостряет
социальное сознание – и как результат Мирон бросает работу ради записи дебютного
альбома «Вечный Жид», в который вкладывает всю свою злобу и неприкаянность,
ставя пулеметную читку на музыкальные рельсы грайма и дабстепа.

В итоге пластинку замечают не только привыкшие к мироновским провокациям
профильные хип-хоп-сайты, но и мейнстримные издания, хором называющие альбом
одной из сильнейших рэп-записей 2011 года. Так Oxxxymiron, в точном соответствии
со своим псевдонимом являющийся противоречивым гибридом самоуверенного
экстраверта и забитого отшельника, люмпена и интеллигента, наконец оказывается
услышан. Теперь, после распада не оправдавшей надежд предыдущей команды, он
отправляется в сольное плавание – и будьте уверены, он выплывет.
BIO
ox = Artist.create!(name: 'Oxxxymiron', bio: ox_bio, city: 'Лондон')
['Оксимирон', 'Окси', 'Мирон'].each { |a| ox.aliases.create!(name: a) }

ch = Artist.create!(name: 'the Chemodan', city: 'Петрозаводск', rap_group: true)
['Чемо', 'Чемодан Клан'].each { |a| ch.aliases.create!(name: a) }

luperkal = Artist.create!(name: 'Луперкаль')
ripbeat  = Artist.create!(name: 'RipBeat')
olga     = Artist.create!(name: 'Ольга Шибалова')
sharon   = Artist.create!(name: 'SharOn')

[luperkal, ripbeat, olga, sharon].each do |m|
  pm.memberships.create!(member_id: m.id)
end

louie = Artist.create!(name: 'Грязный Луи', city: 'Петрозаводск')
['Чемодан', 'Луи'].each { |a| louie.aliases.create!(name: a) }

brick = Artist.create!(name: 'Brick Bazuka', city: 'Петрозаводск')
['Брик Базука'].each { |a| brick.aliases.create!(name: a) }

[louie, brick].each do |m|
  ch.memberships.create!(member_id: m.id)
end

# Проект Увечье

# 1 - Экзистенциальная тоска
existential_anguish_t = 'Экзистенциальная тоска'
existential_anguish_l =<<LYRICS
Время раздавать и выхватывать, вряд ли новатор я,
И мне до пьедесталов всех как-то далековато.
Быт, как каша манная — чуть теплая и комковатая.
И всё, что в силах изменить — лишь в контакте аватар.
Это не трава-то заставляет брать перо, проматывать,
Те хроники, где лился Кроненбург под треск травматов.
Мой Иннсмут пал. Податься лимитой в город-громаду
Или сдохнуть здесь, между домами, в гнили ароматов?
На этих стенах хитрый тэг закрутит маркер маркий
И где-то в темных переулках мутят марки нарки.
Околозима — я ждал тебя в холодном парке в парке,
Дома, дворы и арки, мой пустынный Аркхем.
Голодный Хартланд, что глотал своих детей, как Кронос,
Мозги на вынос, фонаря желтого света конус.
Экзистенциальная тоска. Я, как презренный комерс,
Разменяю сплин на ваши лайки, тем и успокоюсь.
Ведь может просто все в душе однажды накипеть и
По телеку кривлялся вялый вигер-педик
Опять надергал слов из википедий,
До того дойдет что ты решишься просто выйти петь им.

Припев:

Об этом точно не напишут в блог.
Опять зависнет полоса загрузки.
Кто-то вывел на стене: «Мы русские — с нами Бог»,
А внизу дописано: «Я — Бог, со мною русские».

К югу от границы, к западу от солнца,
Пальцы небоскребов, Нибелунгов транспортные кольца.
Я жду тот самый миг, когда нить оборвется,
Все мы смертные танатонавты, как канатоходцы.
И кто-то нам на лбу намалевал мишень,
Рэп не для ушей широких масс, но доступней, чем проза,
Впрочем, че уж там, как завещал нам старина Мишель:
«Путь наш растворится в карминовой струе невроза».
LYRICS
pm.lyrics.create!(title: existential_anguish_t, text: existential_anguish_l)

# 2 - Фабула
plot_t = 'Фабула'
plot_l =<<LYRICS
Мы просыпаемся с закатом в тёмных клетках комнат,
Тёплый плед и кот там, город сер, как Готэм, прочь икота.
Как это — накрыться коконом? Ни СМС, ни звонков там.
Только в памяти абрис лица — такой знакомый контур!

Пьянь залечит раны «Толстяком», закусит с луком чипсы,
Время мчится кувырком, порой прёмся по глупым чиксам.
Отучиться, отслужить, пахать стараясь отличиться,
Чтобы хату обставлять вещицами. Но нахуй надо?

Всё равно потом все переедем по гробам под дёрном,
Всем по маске Гая Фокса выдаст личный Тайлер Дёрден,
И пока мешают водку с Бёрном, шебурша обёрткой,
Я её стараюсь с мира сдёрнуть — пишу рэп с издёвкой.

Над системой ценностей пиздёнок подбородок вздёрнут.
Побороться с миром надо чтоб взошли нужные зёрна.
Ты такой же плоть от плоти русских чернозёмов, зёма.
Эти строки стелятся позёмкой — значит всё мазёво.

Слуги на пайке казенном врут, их не понятен юмор.
Прут, как неприятель с юга. Друг, обида обоюдна.
Это обоюдоострый меч. Тут джинса вместо юбок,
Максы вместо каблуков на юных. Просто подаю им

Песни, чтоб развешивать на стенках собственных профайлов.
Собственно, про фатум я писал. Осознано профапай
годы. Знай, что рэп-то в основном расчитан на профанов,
В модных арафатках, головная боль для моралфагов.

Твой хип-хоп с такой несложной фабулой против моей,
Ставим оттиск штампа на проект, цени гротеск поэм.
Пропуск в фойе — рэп не приносит Форд Фокус скорей,
Это лотерея, где за труд впарят ворох нулей.
LYRICS
pm.lyrics.create!(title: plot_t, text: plot_l)

# 3 - Маршрутка
marshrutka_t = 'Маршрутка'
marshrutka_l =<<LYRICS
В зеркале всё те же щи, ветровка, как щит
от дождя на остановке снова мокнут овощи.
Хули смотришь, мусор, подойди давай, обыщи,
тут воды по щиколотку, так что не взыщи.

Нету прикурить, нет мелочи для конченых бичей.
Те, кто делят чек должны почить бы в пламени печей,
Что-то заточить купить бы надо, поужинать чем.
В плеере Ка Че иду качаю головой по Че.

Долбаный четверг, сентябрь плачет тучами опять.
Небо цвета старых портянок, не курим в затяг.
Стрижен почти наголо хотя без пилота и тяг.
Непохож на оборванца и выпускника путяг.

У кого в запое батя, у кого-то тян,
У кого-то на штанах мотня, кто-то учит матан,
А я коплю ненависть к аморфным существам по дням.
Люди что подобны пням зад вряд ли свой смогут поднять.

Кепочка от Генри Ллойда — невьебенно по моде,
Скоро заметёт зимой дороги, выпей свой имодиум,
Дабы не пучило от осознания, что близко
Миг когда ты станешь победнее Святого Франциска.

Припев:

Снова мимо пролетит маршрутка с двумя восьмерками,
Солнце меркло, дураки гадали над намеками,
А мир прогнил и скоро ебнет по нашим намёткам
И весь этот эпатаж — всего еще одна наёбка.

Ты видишь вокруг белый террор, а я — разгул зверья.
Я здесь и умру, а ты сьебешься в чужие края,
Хули парить мозг? Все твои лозунги — скучный баян.
Антикто ты там? Вот скажи, нахуя?

Гопота прогнила изнутри, но хочет детей.
Кого можно извлечь из глубины пропитых тел?
Спорт и трезвость явно не у дел, вилами по воде
Писаны все правила — ублюдков принял райотдел.

Я легко одет, в бытность студентом не брал академ.
Военком закинул на Кавказ — все планы по пизде.
Насмотрелся на зверьё и там, и по приезду здесь.
Так что про терпимость школоте можешь ерошить шерсть.

Эй йо, мон шер, тут на душе промозглая хмарь.
Объебосы в Марьино танцуют и дуют химарь.
А я жду январь, чтоб белый снег покрыл собой бульвар.
Встретил другана: «Привет, чё как, дела? Оревуар».

Вот уже четырнадцать минут жду под козырьком.
Свет лишь из окон, облезлый кот отогнан пинком.
Надо денег снять, но снова, блять, не помню пинкод.
Сыро, коченеет тело даже в курточке с венком.

Вот она, моя родная. Вижу всё ближе по лужам.
Две восьмерки на боку, теперь я успеваю к ужину.
Теперь всё точно заебись и несказанно рад я
Погрузится в этот транспорт, что такой не толерантный.

Припев

Снова мимо пролетит маршрутка с двумя восьмерками,
Солнце меркло, дураки гадали над намеками,
А мир прогнил и скоро ебнет по нашим намёткам
И весь этот эпатаж — всего еще одна наёбка.

Ты видишь вокруг белый террор, а я — разгул зверья.
Я здесь и умру, а ты сьебешься в чужие края,
Хули парить мозг? Все твои лозунги — скучный баян.
Антикто ты там? Вот скажи, нахуя?
LYRICS
pm.lyrics.create!(title: marshrutka_t, text: marshrutka_l)

# Oxxxymiron

# 1 - Признаки жизни
vital_signs_t = 'Признаки жизни'
vital_signs_l =<<LYRICS
Из Муми-долов, Хоббитонов и слонопотамов,
Из кладовок, антресолей и полуподвалов,
Из переходов, что познали баллоны вандалов,
Офисных окон, где я пробыл рабом феодалов,

Я что-то тихо вынес ночами, заныкал,
И пока начальник мне не скажет «с вещами на выход!»,
Ты как всегда опечалишь барыгу,
Взяв то, что толкает англичанин с очами на выкат.

Мне подождать и поднажать или уйти,
Чтоб это дальше продолжали подражатели?
Несу хуйню и они безропотно вторят,
Но в итоге, кто ученый, а кто подопытный кролик.

Мне нужен врач, лучше на дом и немедленно.
Ватсон, Фрейд, Курпатов, Пеппер.
Горизонт заволокло и где-то хлопнуло окно.
Похуй кто, но дай мне свет: Бог или оптоволокно.

Припев:

Мнеее…
Мне не передать, что в моей
Черепной коробке телепередач.
Я вернулся, держись, мир,
Вы заказали мою голову, я подаю вам признаки жизни.

Я много лет не выпускал стафф,
Ждал, пока он станет жирным, как Фальстаф,
Видать, ты думал, что пора, что ты файв стар,
Ты поспешил, насмешил — это фальстарт.

Я проповедовал щеглам как Франциск Ассизский,
Видел Смерть, она сказала: «Распишись на сиськах».
Мы разной породы, вы — безопасной дорогой,
А я — то желтою кирпичной, то красной ковровой.

Судишь меня? Удостоверься, не мажор ли ты.
Я был голодным эмси, съел других и стал прожорливым.
Ты пугал и свой понос исподтишка толкал,
Ну а пока у тебя даже толстая кишка тонка.

У твоей мамы сестра, что мокра, как водоём,
Её дыра настолько мала, что я наноёб.
Мне пишут эмси: «Нихуя себе, братка, классно»
И вам спасибо, биомасса и протоплазма!

Припев:

Мнеее…
Мне не передать, что в моей
Черепной коробке телепередач.
Я вернулся, держись, мир,
Вы заказали мою голову, я подаю вам признаки жизни.

Если ночью все кошки серы, что же это за чёрный кот,
Что ведёт со мной каждую ночь беседы? Диалоги о чем угодно:
Про закат Европы и ложь системы. Если б это был черт, его бы
Выдавало зловоние, точно из бочки серы, но ничего подобного.

Он глядит за окошко в темень.
Дождь со снегом ебошат с неба.
Мы все в отрывы от почвы слепы,
А на ней будто тощий стебель,
И в том числе ты — одинокий в ячейках и сотах, как мощи в склепах,
Все равно вешать нос щас нехуй,
Против всех и!..

Бра!

Круговая порука.
Тот, кто деньги скопил, завещает их внукам.
Но мои сбережения равны совокупности мной издаваемых звуков.
Ставлю вас в угол.
Коль ты — суперэмси, я — Лекс Лютор.
На концертах лес рук, но я по-прежнему тут на ветру, как флюгер.

Сколько лет я был ситом подземки,
Сколько зим проебал, сколько сил потратил.
Демо-тейпы, онлайн-баттлы, горе-лейблы. Хватит!
И хоть мы из пробирки, но мы не готовы жить на галерке,
В давке как на Ходынке, я джинн из бутылки или чертик из табакерки?

Я один с лампой. От редбулла зрачки — манга.
Депривация сна и неебаться устал, под глазами круги — панда.
Всё что есть в этой ебаной песне, я для вас оторвал от груди — Данко.
Я бы вышел из этой игры, но я боюсь повредить ей гланды.

Припев:

Мнеее…
Мне не передать, что в моей
Черепной коробке телепередач.
Я вернулся, держись, мир,
Вы заказали мою голову, я подаю вам признаки жизни.
LYRICS
ox.lyrics.create!(title: vital_signs_t, text: vital_signs_l)

# 2 - Не говори ни слова
dont_tell_a_word_t = 'Не говори ни слова'
dont_tell_a_word_l =<<LYRICS
Это диктант, пишите с красной строки,
А то рэперки вырастают подчас как раз из таких,
Недоразвитых простофиль с несуразным для остальных
Правописанием — у них иностранный язык.
Но ответы найдены, слог не будет хромать,
Если быть минимально внимательным к бэтл-грамматике,
Так что не говори ни слова, слушай эти монологи
Про этимологию слов и бэтл-терминологию.
Начнем с того, что ты лишь ко мне дополнение,
Я говорю с тобой в повелительном наклонении,
Ты своей милой верен, к несчастью есть у бабы рот,
Я к ней придя, ввернул туда деепричастный оборот.
Она была привлекательна в неглиже,
Говоря обо мне всегда только в дательном падеже,
И настолько чувствительна, что мне, дабы осуществить это,
Не пришлось ее даже склонять, будто существительное.
Предлог для союза был в том, что юнец ты обычный,
И, пока в скобках твои зубы — ты эмси в кавычках,
Запомни, сын, чтобы за жизнь со мной перетереть,
У тебя пока не вырос дефис до размеров тире.
Ты лишь приставка и все выйдет довольно печально,
Англичанин зрит в корень и видит твое окончание,
Так что изволь это уяснить,
Или мы тебе действительно пересчитаем ребра числительными.

Припев:

Ты дрожишь, будто калорифер сломан,
Баттлы — ремесло, так что не говори ни слова,
Выучи язык, хотя бы повтори основы,
Упри глаза в пол или беги назад в школу.
«Замолчи!» — самый колоритный слоган,
Баттлы — ремесло, так что не говори ни слова,
Выучи язык, хотя бы повтори основы,
Упри глаза в пол или беги назад в школу.

Даже если «йоу» для тебя — вводное слово,
Твоя модная школа учит тебя водному поло,
Ты колотишь понты, нахуй конный спорт и латынь,
Коли ты считаешь, что синтаксис — новый сорт кислоты,
М-м-многоточие… твой текст клише набит,
Плюс у глагольных рифм столь несовершенный вид,
Ты не Ахиллес, но я приду с заточкой за пятой твоей
И вырежу смайлик на ней — точка с запятой!
Спасибо всем за интересные мнения.
Я говно, но каждый раунд для моих соперников — место имения,
Я не жаден до поклонения, но сам подумай, почему
Их победы всегда в сослагательном наклонении?
Я не отвечаю на вопрос «О ком? О чем?» я пишу,
Но коли ты такой тупой, то вот отчет,
Ведь когда 228 Шокку с обиды диссы писал,
Я увидел второе лицо единственного числа.
Честное слово, я считаю, Чест — самородок,
Каково дойти до шестого, коль ты женского рода?
Это торжественная ода, мой предшественник Короб,
Прости, что сейчас против тебя твой же божественный порох.
Ваши наречия не интересны теперь ничем,
Где сложносочиненный текст, второстепенный член?
Я скажу при честном народе, ваш хип-хоп в навозе,
Ведь не чувствуешь свой язык, как при зубном наркозе.

Припев:

Ты дрожишь, будто калорифер сломан,
Баттлы — ремесло, так что не говори ни слова,
Выучи язык, хотя бы повтори основы,
Упри глаза в пол или беги назад в школу.
«Замолчи!» — самый колоритный слоган,
Баттлы — ремесло, так что не говори ни слова,
Выучи язык, хотя бы повтори основы,
Упри глаза в пол или беги назад в школу.
LYRICS
ox.lyrics.create!(title: dont_tell_a_word_t, text: dont_tell_a_word_l)

# 3 - Восточный Мордор
east_mordor_t = 'Восточный Мордор'
east_mordor_l =<<LYRICS
Я не просто баламут, хам,
Я свой собственный Плутарх:
Это летопись,
Нужны разные флоу? У меня девять есть,
Зови меня «Ву-Танг»,
И пусть ты хоть Аламут брал,
Но я неприступен,
Я не преступен,
Хотя тут вам даже дети продадут грамм,
Половину зовут Хан,
Если тут кто-то курд, то он не Воннегут,
Дам слово, что я не расист,
Но тут каждый второй — орангутан.
Всюду блуд, Болливуд, хлам,
Это Е16, вперемешку нации, Бангладеш, вьетнамцы,
И полно матерей в шестнадцать, а я белый, как мутант.
Да, это дом, хоть и город не Питер,
Битло на репите, и я сру на вас,
Для кого-то Борат — Юпитер,
Для кого-то Бруно — Марс.
А я делаю драм или дабстеп, грайм и не бабский рэп,
Хотя это и вряд ли придаст мне
В глазах вашего тайного братства
Вес или статус Блаватской,
Мне угнать пепелац бы,
Улететь и не видать всего блядства,
Но, видать, я натаскан на вас,
Будто амстафф на фас или янки на фастфуд,
Да, я хочу заграбастать богатство,
Но в пизду ваш парад пидорастов,
Быть властью обласканным пастором паствы?
Уж лучше пересадка на Пластоу!
Мне ваши слова, будто капли с гуся,
Я уйду, лишь когда будет под пятьдесят,
Не живя тут, понять сути грайма нельзя,
Я с тех самых улиц, где грайм родился,
И тут грайм не иссяк,
Это крайний Ист-Сайд, а не север, где Хайм и Исаак,
Твоя банда — детсад, а не команда Друзя,
Я придумал себя и собрал по частям.
Это восточный Лондон,
Он как отчий дом нам, но забудь его лубочный образ,
Тебе тут будет очень стремно, я ночью черной
Поведу через Восточный Мордор,
Подзамочный город
Оживет в водоемах и сточных водах,
В проемах барочных окон,
Е2, Е4 — районы с почтовым кодом,
А не ход против черных,
Их тут полчища, орды,
Привлеченные сочным кормом,
Как мы в девяносто чертвертом,
Когда я еще был не в счет и никчемным,
Капюшон оторочен черным,
Все хотят весь пирог, а не кусочек торта,
Всюду почерк черта, под его чечеткой
Хрустят мои позвоночник и ребра.
Большой куш, а не Лондон Джама,
И тебя душит новая жаба,
Ведь вы вроде украли все, но знай:
Каждый мой трек родит новый жанр.
У нас изобретают стили, будто банкноты в Китае,
И не говорят «ой», когда что-то роняют, а когда кого-то кидают.
LYRICS
ox.lyrics.create!(title: east_mordor_t, text: east_mordor_l)

# the Chemodan

# 1 - Dead Мороз
dead_moroz_t = 'Dead Мороз'
dead_moroz_l =<<LYRICS
В этот вечер, тихо в залах ожидания.
В этот вечер Дед Мороз исполнит желания.
Струйкой желтой криво, но гордо,
Он напишет на снегу:
Ребята с Новым годом!

Я вел себя плохо-не бред ли?
Я вел себя плохо-ну подари мне Бентли!
Для тебя ведь не сложно, наверное,
В нормальной комплектации, с кондиционером.
Я зацепил по акции ацкой заебанского советского шампанского.
Килограмм мандаринов сочных
И я за них заплатил за половину точно.
Пустяки, то что вел себя не очень,
Добрый дедушка подарит, что ребенок хочет.
А именно мешок грецких орехов,
Три Анфисы Чеховых и первого дэху.
Больше зелени не только в смысле филок.
Ещё хочу аквариум бессмертных рыбок.
Блядь заряженным мокрым в центре
И как я уже сказал сука на хуй Бентли.
Не стать Пекину столицей России.
Каждой полной девчонке болеть анорексией.
Каждому ребенку, его сестрам и братьям
Небьющего мать и непьющего батю.
Всем неизменным измениться,
Пусть полиция будет не тем, чем была милиция.
Всем хорошим людям свободу,
Тут Грязный Луи, с новым мать его годом!

В этот вечер, тихо в залах ожидания.
В этот вечер Дед Мороз исполнит желания.
Струйкой желтой криво, но гордо,
Он напишет на снегу: ребята с Новым годом!
LYRICS
ch.lyrics.create!(title: dead_moroz_t, text: dead_moroz_l)

# 2 - Выкупаешь
bringing_to_light_t = 'Выкупаешь'
bringing_to_light_l =<<LYRICS
Я за здоровый образ жизни не буду затирать тебе.
Либо ты с нами, либо ты — круги на воде.
Приведи меня, мама будет охать и ахать.
Если курить для меня хобби, то пошел я «тсссс»…
Нахуй. Я в дым, и мне заебись.
Я хуево смонтировал свою жизнь.
Минеральная вода «Исток», как-никак.
Слушаю группу Кровосток или как-то так.
Уот да фак? Без дураков.
Всё больше китайцев в трюмах судов
Нормальненький пацик вышел по УДО.
Этот трек делит твою жизнь на «после» и «до», него
Не надо ваших рук, справлюсь сам как-нибудь
Хочешь, запомни меня навсегда, а лучше — забудь.
Забудь меня, внемлю
Холодного меня зароют в теплую землю
В неё воткнешь цветы, и тогда я воскресну
Чтобы сделать воздух пресным
Чтобы сделать воздух, наполненным дымом
Чтобы этот рэп всегда оставался красивым
Ты сомневалась? А я свободный
Только свободный мэн курит через водный
А я и есть свободный
Только свободный мэн курит через водный

Припев:

Выкупаешь нарика по рту это тру
Выдуваешь парика менту
Выкупаешь нарика по рту это тру
Выдуваешь парика менту

Выкупаешь нарика по рту это тру
Выдуваешь парика менту
Выкупаешь нарика по рту это тру
Выдуваешь парика менту

Не откладывай на завтра то,
Что можно сделать через неделю
Не верю, скажешь, что это ложь, ну же
Что чемодан внутри больше, чем снаружи
Сколько ешь? Три уже? Красавец
И мои вредные привычки от меня избавятся
И нас извлекут из-под обломков
В красном углу папира, в синем углу – стопка
Мы утопленники этой воды
Эти треки сделают тебя седым
Акция, длиною в жизнь «Умри Молодым»
Похоже, в этом поможет мой дым
Быть, блять, или не быть
Давай катать квадратное, круглое носить
И где-то на подъезде тени играют, значит
Семеро ждут одного, если один банчит.

Припев:

Выкупаешь нарика по рту это тру
Выдуваешь парика менту
Выкупаешь нарика по рту это тру
Выдуваешь парика менту

Выкупаешь нарика по рту это тру
Выдуваешь парика менту
Выкупаешь нарика по рту это тру
Выдуваешь парика менту
LYRICS
ch.lyrics.create!(title: bringing_to_light_t, text: bringing_to_light_l)

# 3 - Стационар «Счастье»
hospital_happiness_t = 'Стационар «Счастье»'
hospital_happiness_l =<<LYRICS
Он был как будто один в этом мире
Думал, что встретит старость с Сони Плейстейшн четыре.
Я еще думал, под простынёю дрожа,
Нахуй он тогда вышел в окно шестого этажа.
И мне немного жаль, того зрачка овал
Но он обожал играть, и играл.
Ты думал, что это Кобзон? Это не он.
Даже Изя Шниперсон видит сон
Холодный Чёнки Чёнки взгляд тонкий
Эдвард руки-ножницы — хуйня.
Я Луи руки-бонги
Парни и девчонки, Викторы и Насти
Знают что такое счастье, к счастью
Дул ветер, но почему-то стояла вода
И все они попадали туда, навсегда
Дергал Ваня ногами, но стояла вода
И все они попадали туда, навсегда

Припев:

Поутру, отвор замка, стационар в кумаре
Парень в рубахе идет на поцелуй к маме
Там выходные, есть всеобщий праздник
Но тем, кто сюда постучал
На вязкий есть маза.

Нахуй нужен солдату ужин?
И обед, и завтрак, в принципе не нужен тоже
Контрафактный детский крем разъедает кожу
А вон, безумец жадно глотает воду из лужи
То ли он знает что-то, хуй поймешь
Галлюцинагена грибной дождь.
Хорошего мало, но в то же время много.
Извечный атеист вскрикнет «Я познал Бога!»
Слепой переведет зрячего через дорогу
И наркоман не бахнется, а угостит друга
Возненавидит Зенит заядлый фан
Толстая девчонка купит эклер в кафе
Чей-то папа заставит чью-то мамашу ахать
И участковый попросит больше не слать его на хуй
Безумец подойдет к зеркалу, скажет «Здрасьте»
И все они поймут смысл слова «счастье»

Поутру, отвор замка, стационар в кумаре
Парень в рубахе идет на поцелуй к маме
Там выходные, есть всеобщий праздник
Но тем, кто сюда постучал
На вязкий есть маза

Поутру, отвор замка, стационар в кумаре
Парень в рубахе идет на поцелуй к маме
Там выходные, есть всеобщий праздник
Но тем, кто сюда постучал
На вязкий есть маза.
LYRICS
ch.lyrics.create!(title: hospital_happiness_t, text: hospital_happiness_l)
