:- module(train_jargon, [random_train_definition/2]).

random_train_definition(Phrase, Definition) :-
    source_file_property(train_jargon, number_of_clauses(PhraseCount)),
    N is random(PhraseCount) + 1,
    nth_clause(train_phrase(_,_), N, Ref),
    clause(train_phrase(Phrase, Definition), _, Ref).


train_phrase('AGE', 'Seniority, length of service').
train_phrase('AIR MONKEY', 'Air-brake repairman').
train_phrase('ALL DARKIE, NO SPARKY', '(Hi-Ball on a roll by)').
train_phrase('ALLEY', 'Clear track in railroad yard').
train_phrase('ANCHOR THEM', 'Set hand brakes on still cars; the opposite is release anchors').
train_phrase('ARMSTRONG', 'Old-style equipment operated by muscular effort, such as hand-brakes, some turntables, engines without automatic stokers, etc.').
train_phrase('ARTIST', 'Man who is particularly adept, usually with prefix such as brake, pin, speed, etc.').
train_phrase('ASHCAT', 'Locomotive fireman').
train_phrase('BACK TO THE FARM', 'Laid off on account of slack business. When a man is discharged he is given six months twice a year').
train_phrase('BAD ORDER', 'Crippled car or locomotive, often called cripple. Must be marked at night by a blue light when men are working around it').
train_phrase('BAIL IT IN', 'Feed the locomotive firebox').
train_phrase('BAKE HEAD', 'Locomotive fireman. Also called bell ringer, blackie, and many other names scattered throughout this glossary').
train_phrase('BALING-WIRE MECHANIC', 'A man of little mechanical ability').
train_phrase('BALL OF FIRE', 'Fast run').
train_phrase('BALLAST', 'Turkey or chicken dressing').
train_phrase('BALLAST SCORCHER', 'Speedy engineer').
train_phrase('BAND WAGON', 'Pay car or pay train from which wages were handed out to railroad employees').
train_phrase('BANJO', 'Fireman''s shovel; old-style banjo-shaped signal').
train_phrase('BAREFOOT', 'Car or engine without brakes. (Many locomotives built in the 1860''s and 1870''s were not equipped with brakes except on the tank)').
train_phrase('BARN', 'Locomotive roundhouse, so-called from the building in which streetcars are housed').
train_phrase('BAT THE STACK OFF OF HER', 'Make fast time, work an engine at full stroke').
train_phrase('BATTING ''EM OUT', 'Used generally by switchmen when a yard engine is switching a string of cars').
train_phrase('BATTLESHIP', 'Large freight engine or interurban car, or a coal car. Also a formidable female, such as the landlady or a henpecked man''s wife').
train_phrase('BEANERY', 'Railroad eating house. Beanery queen is a waitress').
train_phrase('BEANS', 'Meet orders; lunch period').
train_phrase('BEAT ''ER ON THE BACK', 'Make fast time; work an engine at full stroke').
train_phrase('BEEHIVE', 'Railroad yard office').
train_phrase('BELL RINGER', 'Locomotive fireman').
train_phrase('BEND THE IRON', 'Change the position of the rust a switch. Also called bend or bend the rail').
train_phrase('BIG BOYS', 'Special trains for officials').
train_phrase('BIG E', 'Engineer, so called from the large initial on membership buttons of the Brotherhood of Locomotive Engineers').
train_phrase('BIG FOUR', 'The four operating Brotherhoods: Brotherhood of Railroad Trainmen, Order of Railway Conductors, Brotherhood of Locomotive Firemen and Enginemen, and Brotherhood of Locomotive Engineers').
train_phrase('BIG HOLE', 'Emergency application of air-brake valve, causing a quick stop. Big-holing her, the same as wiping the clock, is making an emergency stop').
train_phrase('BIG HOOK', 'Wrecking crane').
train_phrase('BIG O', 'Conductor; so named from first initial in Order of Railway Conductors. Sometimes called big ox and less complimentary terms').
train_phrase('BIG ROCK CANDY MOUNTAINS', 'Hobo''s paradise, as described in song by Harry K. McClintock. (See Indian Valley Line)').
train_phrase('BINDERS', 'Hand brakes').
train_phrase('BINDLE STIFF or BLANKET STIFF', 'Hobo who totes a blanket and uses it wherever night finds him. (Bindle is a corruption of "bundle")').
train_phrase('BIRD CAGE', 'Brakeman''s or switchman''s lantern').
train_phrase('BLACK DIAMONDS', 'Company coal. Diamond cracker is a locomotive fireman').
train_phrase('BLACK HOLE', 'Tunnel').
train_phrase('BLACK ONES', 'Railway Express refrigerator or boxcars having no interior illumination pressed into mail service during the Christmas rush').
train_phrase('BLACK SNAKE', 'Solid train of loaded coal cars').
train_phrase('BLACKBALLED', 'black-listed, boycotted').
train_phrase('BLACKJACKS', 'Fifty-ton Santa Fe coal cars painted black').
train_phrase('BLAZER', 'Hot journal with packings afire').
train_phrase('BLEED', 'Drain air from. Bleeder is valve by which air is bled from auxiliary reservoir of a car').
train_phrase('BLIND BAGGAGE', 'Hobo riding head end of baggage car next to tender, where no door is placed; commonly called riding the blinds').
train_phrase('BLIZZARD LIGHTS', 'Originally the lights on either side of the headlight that served in emergency when the oil-burning headlight blew out. Now they indicate the train is nonschedule or extra').
train_phrase('BLOOD', 'Old-time engine built by Manchester Locomotive Works. Mr. Aretas Blood being the builder''s name').
train_phrase('BLOW ''ER DOWN', 'Reduce water in a locomotive boiler when carrying too much').
train_phrase('BLOW SMOKE', 'Brag').
train_phrase('BLOW UP', 'Use the blower to increase draft on the fire and thereby raise the steam pressure in the boiler. Also quit a job suddenly').
train_phrase('''BO', 'Hobo. ''Bo chaser is freight brakeman or railroad policeman').
train_phrase('BOARD', 'Fixed signal regulating railroad traffic, usually referred to as slow board., order board., clear board (for clear tracks) or red board (stop). Do not confuse this with extra board or spare board, colloquially known as slow board or starvation list, usually containing names of qualified train or enginemen not in regular active service who are called to work in emergencies. These names are listed in order of seniority, the man hired most recently being the last one called to service').
train_phrase('BOBTAIL', 'Switch engine').
train_phrase('BOILER ASCENSION', 'Boiler explosion').
train_phrase('BOILER HEADER', 'Man riding in engine cab').
train_phrase('BOILER WASH', 'A high-water engineer').
train_phrase('BOOK OF RULES', 'Examination based on facts in rulebook').
train_phrase('BOOKKEEPER', 'Trainman who makes out reports; flagman').
train_phrase('BOOTLEGGER', 'Train that runs over more than one railroad').
train_phrase('BOOMER', 'Drifter who went from one railroad job to another, staying but a short time on each job or each road. This term dates back to pioneer days when men followed boom camps. The opposite is home guard. Boomers should not be confused with tramps, although they occasionally became tramps. Boomers were railroad workers often in big demand because of their wide experience, sometimes blackballed because their tenure of stay was uncertain. Their common practice was to follow the "rushes"-that is, to apply for seasonal jobs when and where they were most needed, when the movement of strawberry crops, watermelons, grain, etc., was making the railroads temporarily short-handed. There are virtually no boomers in North America today. When men are needed for seasonal jobs they are called from the extra board').
train_phrase('BOUNCER', 'Caboose').
train_phrase('BOWLING ALLEY', 'Hand-fired coal-burning locomotive. (A fireman throwing in the lumps of coal goes through motions that resemble bowling)').
train_phrase('BOXCAR TOURIST', 'Hobo').
train_phrase('BRAIN PLATE', 'Trainman''s cap or hat badge').
train_phrase('BRAINS or THE BRAINS', 'Conductor; sometimes called brainless wonder, a term also applied to any train or engineman or official who does things his fellows consider queer').
train_phrase('BRAKE CLUB', 'Three-foot hickory stick used by freight trainmen to tighten hand brakes. Sometimes called sap or staff of ignorance').
train_phrase('BRASS', 'A babbitt-lined blank of bronze that forms the bearing upon which the car rests. To brass a car is to replace one of those bearings').
train_phrase('BRASS BUTTONS', 'Passenger conductor on railroad or streetcar line').
train_phrase('BRASS COLLAR or BRASS HAT', 'Railroad official. Term may have originated from gold-braided collar of conductor''s uniform and brass plate on his cap').
train_phrase('BRASS POUNDER', 'Telegraph operator').
train_phrase('BREEZE', 'Service air').
train_phrase('BRIDGE HOG', 'Bridge and building carpenter of the old school antedating steel and concrete').
train_phrase('BROKEN KNUCKLES', 'Railroad sleeping quarters').
train_phrase('BROWNIES', 'Demerits. This system is traced back to George R. Brown, general superintendent of the Fall Brook Railway (now part of the New York Central) in 1885. He thought the then current practice of suspending men for breaking rules was unfair to their families and substituted a system of demerit marks. Too many demerits in a given period resulted in dismissal. The Brown system, with many variations, has since been widely adopted by the railroad industry. A superintendent''s private car is called brownie box or brownie wagon').
train_phrase('BUCK THE BOARD', 'Working the extra board. (See board)').
train_phrase('BUCKLE THE RUBBERS', 'Connect air, steam, or signal hose').
train_phrase('BUG', 'Telegraph instrument or trainman''s or switchman''s light, which is also called bug torch. Bug may also be a three-wheeled electric truck that carries mail and baggage around terminals').
train_phrase('BUG LINE', 'Telephone connection between engine house and yard or telegraph office').
train_phrase('BUG SLINGER', 'Switchman or brakeman').
train_phrase('BUGGY', 'Caboose; rarely applied to other cars').
train_phrase('BULL', 'Railroad policeman. Also called flatfoot or gumshoe, but the distinctive railroad terms are cinder dick and ''bo chaser').
train_phrase('BULL PEN', 'Crew room').
train_phrase('BULLGINE', 'Steam locomotive').
train_phrase('BULLNOSE', 'Front drawbar of a locomotive').
train_phrase('BUMP', 'Obtain another man''s position by exercising seniority. When a crew is deprived of its assignment, as when a train is removed from the timetable, its members select the jobs they wish from those held by others with less whiskers').
train_phrase('BUMPER', 'Post at end of spur track, placed there to stop rolling stock from running onto the ground').
train_phrase('BUNCH OF THIEVES', 'Wrecking crew').
train_phrase('BUST UP A CUT', 'To separate the cars in a train, removing some that have reached their destination, assigning others to through trains, etc.').
train_phrase('BUTTERFLY', 'Note thrown (or handed) from train by an official to a section foreman or other employee, so called because it may flutter along the track, although it is usually weighted down when thrown from a car').
train_phrase('BUZZARDS'' ROOST', 'Yard office').
train_phrase('CABOOSE BOUNCE, CABOOSE HOP', 'Early term for a train composed only of an engine and caboose').
train_phrase('CAGE', 'Caboose').
train_phrase('CALLER', 'One whose duty is to summon train or engine crews or announce trains').
train_phrase('CALLIOPE', 'Steam locomotive').
train_phrase('CAMEL or CAMELBACK', 'Engine with control cab built over middle of boiler, suggesting camel''s hump. Also called Mother Hubbard type').
train_phrase('CAN', 'Tank car').
train_phrase('CANNED', 'Taken out of service').
train_phrase('CAPTAIN', 'Conductor; often called skipper. This title dates from Civil War days when some railroads were run by the Army and the conductor was in many cases a captain').
train_phrase('CAR-CATCHER', 'Rear brakeman').
train_phrase('CAR KNOCKER', 'Car inspector or car repairer-from the early custom of tapping the wheels to detect flaws. Also called car whacker; and car toad (because he squats while inspecting), car tink, and car tonk').
train_phrase('CAR-SEAL HAWK', 'Railroad policeman').
train_phrase('CARD', 'Credentials showing Brotherhood or Union membership').
train_phrase('CARHOUSE CAR', 'Covered cement car').
train_phrase('CARRY A WHITE FEATHER', 'Show a plume of steam over the safety valves of the engine').
train_phrase('CARRYING GREEN', 'Train whose engine displays green flags by day or green lights by night to indicate that a second section is following closely. Carrying white in the same manner signifies an extra train').
train_phrase('CARRYING THE BANNER', 'Flagging. Also wearing ostentatious Brotherhood emblems, frequently done by ''bos in working the main stem for a handout').
train_phrase('CARRYING THE MAIL', 'Bringing train orders').
train_phrase('CASEY JONES', 'Any locomotive engineer, especially a fast one. Name derived from John Luther (Casey) Jones').
train_phrase('CATWALK', 'Plank walk on top of boxcars; sometimes called the deck from which comes the word deckorate').
train_phrase('CHAIN GANG', 'Crew assigned to pool service, working first in, first out').
train_phrase('CHAMBERMAID', 'Machinist in roundhouse').
train_phrase('CHARIOT', 'Caboose, or general manager''s car').
train_phrase('CHASING THE RED', 'Flagman going back with red flag or light to protect his train').
train_phrase('CHECKER', 'A company spy, particularly one checking up on loss of materials or of the receipts of an agent or conductor').
train_phrase('CHERRY PICKER', 'Switchman, so called because of red lights on switch stands. Also any railroad man who is always figuring on the best jobs and sidestepping undesirable ones (based on the old allusion, "Life is a bowl of cherries")').
train_phrase('CHEW CINDERS', 'Engines do this when reversed while running and while working quite a bit of steam').
train_phrase('CHIP PIES', 'Narrow-gauge cars').
train_phrase('CINDER CRUNCHER', 'Switchman or flagman. Cinder skipper is yard clerk').
train_phrase('CINDER DICK', 'Railroad policeman or detective').
train_phrase('CINDER SNAPPER', 'Passenger who rides open platforms on observation car').
train_phrase('CIRCUS', 'Railroad').
train_phrase('CLAW', 'Clinker hook used by fireman').
train_phrase('CLEARANCE CARD', 'Authority to use main line').
train_phrase('CLOCK', 'Steam gauge. (See wiping the clock; don''t confuse with Dutch clock). Also fare register').
train_phrase('CLOWN', 'Switchman or yard brakeman. Clown wagon is caboose').
train_phrase('CLUB', 'Same as brake club. Club winder is switchman or brakeman. A brakeman''s club was usually his only weapon of defense against hoboes').
train_phrase('COAL HEAVER', 'Fireman, sometimes called stoker').
train_phrase('COCK-LOFT', 'Cupola of a caboose. Also called crow''s nest').
train_phrase('COFFEE', 'Respite period enjoyed by baggagemen while awaiting arrival of the next train. Also called spot').
train_phrase('COFFEEPOT', 'Little, old, steam locomotive').
train_phrase('COLLAR AND ELBOW JOINT', 'Boardinghouse. (There isn''t too much room at dinner table)').
train_phrase('COLOR-BLIND', 'Employee who can''t distinguish between his own money and the company''s').
train_phrase('COMPANY BIBLE', 'Book of rules').
train_phrase('COMPANY JEWELRY', 'Trainman''s hat, badge, and switch keys').
train_phrase('COMPANY NOTCH or WALL STREET NOTCH', 'Forward corner of the reverse gear quadrant. It is called the company notch because an engine exerts full pulling power when worked with a full stroke').
train_phrase('CONDUCER', 'Conductor').
train_phrase('CONSIST', 'Contents or equipment of a train. Report form sent ahead so yardmaster can make plans for switching the train. The report is usually dropped off to an operator; this is dropping the consist').
train_phrase('COOL A SPINDLE', 'Cool a hotbox by replacing the brass or putting water on the bearing').
train_phrase('COON IT', 'Crawl').
train_phrase('CORNERED', 'When a car, not in the clear on a siding, is struck by a train or engine').
train_phrase('CORNFIELD MEET', 'Head-on collision or one that is narrowly averted').
train_phrase('COULDN''T PULL A SETTING HEN OFF HER NEST', 'Derogatory description of old-fashioned locomotive').
train_phrase('COUNTING THE TIES', 'Reducing speed').
train_phrase('COW CAGE', 'Stock car. Also called cow crate').
train_phrase('COWCATCHER', 'Pilot. The old term was discarded by railroad officials, probably because it was a butt for jokesters. You''ve often heard about the passenger on a slow local train complaining to the conductor, "I don''t understand why you have the cowcatcher on the front of the engine. This train can never overtake a cow. But if you''d attach it to the rear of the train it might at least discourage cows from climbing into the last car and annoying the passengers"').
train_phrase('CRADLE', 'Gondola or other open-top car').
train_phrase('CRIB', 'Caboose').
train_phrase('CRIPPLE', 'See bad order').
train_phrase('CROAKER', 'Company doctor').
train_phrase('CROWNING HIM', 'Coupling a caboose on a freight train when it is made up').
train_phrase('CRUMB BOSS', 'Man in charge of camp cars').
train_phrase('CRUMMY', 'Caboose. Also called crum box, crib and many other names. Innumerable poems have been written about "the little red caboose behind the train"').
train_phrase('CUPOLA', 'Observation tower on caboose').
train_phrase('CUSHIONS', 'Passenger cars. Cushion rider may be either a passenger or member of passenger-train crew. (See varnished cars)').
train_phrase('CUT', 'Several cars attached to an engine or coupled together by themselves. Also that part of the right-of-way which is excavated out of a hill or mountain instead of running up over it or being tunneled through it').
train_phrase('CUT THE BOARD', 'Lay off the most recently hired men on the extra list. (See board)').
train_phrase('DANCING ON THE CARPET', 'Called to an official''s office for investigation or discipline').
train_phrase('DEADBEAT', ' is defined by Webster as "one who persistently fails to pay his debts or way." The word was coined in the late 1800''s when railroad workers noticed that loaded freight cars made a different beat over the track-joints than cars that weren''t carrying a load. The empty cars made a "dead beat" which meant they weren''t paying their way. By the beginning of the 20th century "deadbeat" came to encompassed people who failed to carry their share of the load also.').
train_phrase('DEAD IRON and LIVE IRON', 'The two sets of tracks on a scale').
train_phrase('DEAD MAN''S HOLE', 'Method of righting an overturned engine or car. A six-foot hole is dug about forty feet from the engine or car, long enough to hold a large solid-oak plank. A trench is then dug up to the engine and heavy ropes laid in it, with a four-sheave block, or pulley, at the lower end of the engine and a three-sheave block at the top of the boiler. Chains are fastened to the underside of the engine and hooked to the three-sheave block. The free end of the rope is then hooked to the drawbar of a road engine. The hole is filled-packed hard to hold the "dead man" down against the coming pull. When the engine moves up the track she pulls ropes over the top of the boiler of the overturned locomotive on the chains that are fastened to the lower part, rolling the engine over sidewise and onto her wheels again').
train_phrase('DEAD MAN''S THROTTLE', 'Throttle that requires pressure of operator''s hand or foot to prevent power shut-off and application of brakes. An engine so equipped would stop instantly if the operator fell dead. Also called dead man''s button').
train_phrase('DEADHEAD', 'Employee riding on a pass; any nonpaying passenger. Also fireman''s derisive term for head brakeman who rides engine cab. Also a locomotive being hauled "dead" on a train').
train_phrase('DECK', 'Front part of engine cab. Also catwalk on roofs of boxcars').
train_phrase('DECKORATE', 'Get out on top of freight cars to set hand brakes or receive or transmit signals. Derived from deck').
train_phrase('DEHORNED', 'Demoted or discharged').
train_phrase('DETAINER or DELAYER', 'Train dispatcher').
train_phrase('DIAMOND', 'Railroad crossover. Black diamonds is coal').
train_phrase('DIAMOND CRACKER or DIAMOND PUSHER', 'Locomotive fireman').
train_phrase('DICK SCRATCHER', 'Dispatcher').
train_phrase('DIE GAME', 'Stall on a hill').
train_phrase('DING-DONG', 'Gas or gas-electric coach, usually used on small roads or branch lines not important enough to support regular trains; name derived from sound of its bell. Sometimes called doodlebug').
train_phrase('DINGER', 'Conductor (man who rings the bell)').
train_phrase('DINKY', 'Switch engine without tender, used around back shop and roundhouse, or any small locomotive. Alsoa four-wheel trolleycar').
train_phrase('DIPLOMA', 'Clearance or service letter; fake service letter').
train_phrase('DIRTY CAR', 'Storage car containing a varied assortment of mail and parcels that demand extra work in separating').
train_phrase('DISHWASHERS', 'Engine wipers at roundhouse').
train_phrase('DITCH', 'That part of the right-of-way that is lower than the roadbed. A derailed train is "in the ditch"').
train_phrase('DOGCATCHERS', 'Crew sent out to relieve another that has been outlawed-that is, overtaken on the road by the sixteen-hour law, which is variously known as dog law, hog law, and pure-food law').
train_phrase('DOGHOUSE', 'Caboose or its cupola').
train_phrase('DONEGAN', 'Old car, with wheels removed, used as residence or office. Originated about 1900, when a Jersey Central carpenter and two foremen, all named Donegan, occupied three shacks in the same vicinity. People were directed to the Donegans so often that the shacks themselves came to be known by that name. The name stuck, even after the men had passed on and the shacks had been replaced by converted old cars').
train_phrase('DONKEY', 'Derisive term for section man; small auxiliary engine').
train_phrase('DOODLEBUG', 'Rail motorcar used by section men, linemen, etc. Also called ding dong').
train_phrase('DOPE', 'Order, official instructions, explanation. Also a composition for cooling hot journals').
train_phrase('DOPE IT', 'Use compound in the water to keep it from boiling when working an engine hard').
train_phrase('DOPE MONKEY', 'Car inspector').
train_phrase('DOUBLE', 'In going up a hill, to cut the train in half and take each section up separately').
train_phrase('DOUBLE-HEADER', 'Train hauled by two engines').
train_phrase('DOUSE THE GLIM', 'Extinguish a lantern, especially by a sudden upward movement').
train_phrase('DRAG', 'Heavy train of "dead" freight; any slow freight train, as contrasted with manifest or hotshot').
train_phrase('DRAWBAR FLAGGING', 'Flagman leaning against the drawbar on the caboose, or standing near the caboose, to protect the rear end of his train, instead of going back "a sufficient distance" as rules require. Such a man is taking a chance, due maybe to laziness, exhaustion, severe cold, fear of the train leaving without him, etc.').
train_phrase('DRIFTING THROTTLE', 'Running with steam throttle cracked open to keep air and dust from being sucked into steam cylinders').
train_phrase('DRILL CREW', 'Yard crew. (See yard)').
train_phrase('DRINK', 'Water for locomotive').
train_phrase('DRONE CAGE', 'Private car').
train_phrase('DROP', 'Switching movement in which cars are cut off from an engine and allowed to coast to their places. (See hump)').
train_phrase('DROP A LITTLE RUN-FAST', 'Oil the engine').
train_phrase('DROP ''ER DOWN', 'Pull reverse lever forward. Drop ''er in the corner means to make fast time, figuratively dropping the Johnson bar in one corner of the cab').
train_phrase('DROPPER', 'Switchman riding a car on a hump').
train_phrase('DROWNING IT OUT', 'Cooling an overheated journal').
train_phrase('DRUMMER', 'Yard conductor').
train_phrase('DRUNKARD', 'Late Saturday-night passenger train').
train_phrase('DUCATS', 'Passenger conductor''s hat checks').
train_phrase('DUDE', 'Passenger conductor').
train_phrase('DUDE WRANGLER', 'Passenger brakeman').
train_phrase('DUMMY', 'Employees'' train. Dummy locomotive is a switcher type having the boiler and running gear entirely housed, used occasionally for service in public streets').
train_phrase('DUST-RAISER', 'Fireman (shoveling coal into firebox)').
train_phrase('DUSTING HER OUT', 'Putting sand through the firedoor of an oil burner while working the engine hard; this cuts out the soot in the flues and makes the locomotive steam. Also known as giving the old girl a dose of salts').
train_phrase('DUTCH CLOCK', 'Speed recorder').
train_phrase('DUTCH DROP', 'Rarely used method of bringing a car onto the main line from a spur. The engine heads into the spur, couples head-on to the car, and backs out. When the car is moving fast enough the engine is cut off, speeds up to get back on the main line before the car, then moves forward ahead of the junction between the main line and the spur so the car rolls out behind the engine').
train_phrase('DYNAMITER', 'Car on which defective mechanism sends the brakes into full emergency when only a service application is made by the engineer. Also, a quick-action triple valve').
train_phrase('EAGLE-EYE', 'Locomotive engineer').
train_phrase('EASY SIGN', 'Signal indicating the train is to move slowly').
train_phrase('END MAN', 'Rear brakeman on freight train').
train_phrase('ELECTRIC OWL', 'Night operator').
train_phrase('ELEPHANT CAR', 'Special car coupled behind locomotive to accommodate head brakeman').
train_phrase('EXTRA BOARD', 'See board').
train_phrase('EYE', 'Trackside signal').
train_phrase('FAMILY DISTURBER', 'Pay car or pay train').
train_phrase('FAN', 'Blower on a locomotive boiler').
train_phrase('FIELD', 'Classification yard').
train_phrase('FIELDER or FIELD MAN', 'Yard brakeman').
train_phrase('FIGUREHEAD', 'Timekeeper').
train_phrase('FIRE BOY', 'Locomotive fireman').
train_phrase('FIRST READER', 'Conductor''s train book').
train_phrase('FISH WAGON', 'Gas-electric car or other motorcar equipped with an air horn (which sounds like a fishmonger''s horn)').
train_phrase('FISHTAIL', 'Semaphore blade, so called from its peculiar shape').
train_phrase('FIST', 'Telegraph operator''s handwriting. This script, in the days before telephones, typewriters, and teletypes, was characterized by its swiftness, its bold flowing curves which connected one word with another, and its legibility. Ops were proud of their penmanship').
train_phrase('FIXED MAN', 'Switchman in a hump yard assigned to one certain post from which he rides cars being humped').
train_phrase('FIXED SIGNAL', 'Derisive term for a student brakeman standing on a boxcar with his lamp out and a cinder in his eye').
train_phrase('FLAG', 'Assumed name. Many a boomer worked under a flag when his own name was black-listed').
train_phrase('FLAT', 'Flatcar. Also called car with the top blowed off').
train_phrase('FLAT WHEEL', 'Car wheel that has flat spots on the tread. Also applied to an employee who limps').
train_phrase('FLIMSY', 'Train order. (Standard practice is to issue these on tissue paper to facilitate the making of carbon copies)').
train_phrase('FLIP', 'To board a moving train. The word accurately suggests the motion used').
train_phrase('FLOATER', 'Same as boomer').
train_phrase('FLY LIGHT', 'Miss a meal. Boomers often did that; hoboes still do').
train_phrase('FLYING SWITCH', 'Switching technique in which the engine pulls away from a car or cars she has started rolling, permitting them to be switched onto a track other than that taken by the engine. The switch is thrown instantly after the engine has passed it and just before the cars reach it. This procedure, common in bygone days, is now frowned upon by officials').
train_phrase('FOG', 'Steam').
train_phrase('FOOTBOARD', 'The step on the rear and front ends of switch or freight engines. Many casualties were caused in the "good old days" by switchmen missing these steps on dark slippery nights').
train_phrase('FOOTBOARD YARD MASTER', 'Conductor who acts as yardmaster in a small yard').
train_phrase('FOREIGN CAR', 'Car running over any railroad other than one that owns it').
train_phrase('FOUNTAIN', 'That part of a locomotive where steam issues from the boiler and flows into pipes for lubrication, injection, etc.').
train_phrase('FREEZE A HOB or A BLAZER', 'Cool a heated journal').
train_phrase('FREEZER', 'Refrigerator car. Also reefer or riff').
train_phrase('FROG', 'Implement for rerailing cars or engines. Also an X-shaped plate where two tracks cross').
train_phrase('FUSEE', 'Red flare used for flagging purposes. Its sharp point is driven into the right-of-way and no following train may pass as long as it is burning, although on some roads it is permissible to stop, extinguish the fusee, and proceed with caution in automatic block-signal limits').
train_phrase('GALLOPER', 'Locomotive, the iron horse').
train_phrase('GALLOPING GOOSE', 'A shaky section car').
train_phrase('GALVANIZER', 'Car inspector').
train_phrase('GANDY DANCER', 'Track laborer. Name may have originated from the gander-like tremulations of a man tamping ties, or from the old Gandy Manufacturing Company of Chicago, which made tamping bars, claw bars, picks, and shovels').
train_phrase('GANGWAY', 'Space between the rear cab post of a locomotive and her tender').
train_phrase('GARDEN', 'See yard').
train_phrase('GAS HOUSE', 'Yard office').
train_phrase('GATE', 'Switch').
train_phrase('GAY CAT', 'Tramp held in contempt by fellow vagrants because he is willing to work if a job comes along').
train_phrase('GENERAL', 'Yardmaster, abbreviated Y.M.').
train_phrase('GET THE ROCKING CHAIR', 'Retire on a pension').
train_phrase('GET YOUR HEAD CUT IN', 'Boomer slang for "wise up"').
train_phrase('GIRL or OLD GIRL', 'Affectionate term for steam engine. The locomotive, like the sailing ship, is often called "she" instead of "it"').
train_phrase('GIVE HER THE GRIT', 'Use sand').
train_phrase('GLASS CARS', 'Passenger cars').
train_phrase('GLIM', 'Switchman''s or trainman''s lantern').
train_phrase('GLIMMER', 'Locomotive headlight').
train_phrase('GLORY', 'String of empty cars. Also death, especially by accident').
train_phrase('GLORY HUNTER', 'Reckless, fast-running engineer').
train_phrase('GLORY ROAD', 'Sentimental term for railroad').
train_phrase('GOAT', 'Yard engine. (See yard)').
train_phrase('GOAT FEEDER', 'Yard fireman').
train_phrase('GO HIGH', 'Same as deckorate').
train_phrase('G.M. ', 'General manager. G.Y.M. is general yardmaster').
train_phrase('GODS OF IRON', 'Huge, powerful locomotives').
train_phrase('GON', 'Gondola, or steel-sided, flat-bottom coal car').
train_phrase('GONE FISHING', 'Laid off').
train_phrase('GOO-GOO EYE', 'Locomotive with two firedoors').
train_phrase('GOOSE', 'To make an emergency stop').
train_phrase('GOOSE HER', 'Reverse a locomotive that is under headway').
train_phrase('GO-TO-HELL SIGNAL', 'Signal given with violent motion of hand or lantern').
train_phrase('GRAB IRON', 'Steel bar attached to cars and engines as a hand bold').
train_phrase('GRABBER', 'Conductor of a passenger train. (He grabs tickets)').
train_phrase('GRAMOPHONE', 'Obsolete term for telephone').
train_phrase('GRASS WAGON', 'Tourist car. (Tourists like scenery)').
train_phrase('GRASSHOPPER', 'Old type of locomotive with vertical boiler and cylinders').
train_phrase('GRAVE-DIGGER', 'Section man').
train_phrase('GRAVEYARD', 'Siding occupied by obsolete and disused engines and cars; scrap pile').
train_phrase('GRAVEYARD WATCH', '12.01 A.M. to 8 A.M., or any midnight shift, so called because that shift includes the quietest hours of the day').
train_phrase('GRAZING TICKET', 'Meal book').
train_phrase('GREASE MONKEY', 'Car oiler').
train_phrase('GREASE THE PIG', 'Oil the engine. (See hog)').
train_phrase('GREASY SPOON', 'Railroad eating house. Bill of fare is colloquially known as switch list, fork is hook, butter is grease pot, hotcakes are blind gaskets, and beans are torpedoes').
train_phrase('GREENBACKS', 'Frogs for rerailing engines or cars').
train_phrase('GREENBALL FREIGHT', 'Fruit or vegetables').
train_phrase('GREEN EYE', 'Clear signal. (At the time Cy Warman wrote his celebrated poem, "I Hope the Lights Are White," the clear signal was white and green meant caution. This was changed years ago because of the fact that when a red or green signal lens broke or fell out it exposed a white, thus giving a clear board to engineers even though the signal itself was set to stop or go slow)').
train_phrase('GREETINGS FROM THE DS', 'Train orders from the dispatcher').
train_phrase('GRIEVER', 'Spokesman on grievance committee; Brotherhood or Union representative at an official investigation').
train_phrase('GRIND', 'Shay-geared engine').
train_phrase('GROUNDHOG', 'Brakeman, yardmaster, or switch engine').
train_phrase('GRUNT', 'Locomotive engineer. Traveling grunt is road foreman of engines (hogs). Grunt may also be a lineman''s ground helper; grunting is working as a lineman''s helper').
train_phrase('GUN', 'Torpedo, part of trainman''s equipment; it is placed on the track as a signal to the engineer. Also the injector on the locomotive that forces water from tank to boiler. To gun means to control air-brake system from rear of train').
train_phrase('GUNBOAT', 'Large steel car').
train_phrase('GUT', 'Air hose. Guts is drawbar').
train_phrase('HACK', 'Caboose').
train_phrase('HALF', 'Period of two weeks').
train_phrase('HAM', 'Poor telegrapher or student').
train_phrase('HAND BOMBER or HAND GRENADE', 'Engine without automatic stoker, which is hand-fired').
train_phrase('HAND-ON', 'Train order or company mail caught with the hoop or without stopping').
train_phrase('HANGING UP THE CLOCK', 'Boomer term that meant hocking your railroad watch').
train_phrase('HARNESS', 'Passenger trainman''s uniform').
train_phrase('HASH HOUSE', 'Railroad restaurant or lunch stand').
train_phrase('HAT', 'Ineffectual railroad man. (All he uses his head for is a hat rack)').
train_phrase('HAY', 'Sleep on the job; any kind of sleep. Caboose was sometimes called hay wagon').
train_phrase('HAY BURNER', 'Hand oil lantern, inspection torch. Also a horse used in railroad or streetcar service').
train_phrase('HEAD-END REVENUE', 'Money which railroads receive for hauling mail, express, baggage, newspapers, and milk in cans, usually transported in cars nearest the locomotive, these commodities or shipments being known as head-end traffic').
train_phrase('HEAD IN', 'Take a sidetrack when meeting an opposing train').
train_phrase('HEAD MAN', 'Front brakeman on a freight train who rides the engine cab. Also called head pin').
train_phrase('HEARSE', 'Caboose').
train_phrase('HEEL', 'Cars on end of tracks with brakes applied').
train_phrase('HERDER', 'Man who couples engines and takes them off upon arrival and departure of trains').
train_phrase('HIGHBALL', 'Signal made by waving hand or lamp in a high, wide semicircle, meaning "Come ahead" or "Leave town" or "Pick up full speed." Verb highball or phrase ''ball the jack means to make a fast run. Word highball originated from old-time ball signal on post, raised aloft by pulley when track was clear. A very few of these are still in service, in New England and elsewhere').
train_phrase('HIGHBALL ARTIST', 'A locomotive engineer known for fast running').
train_phrase('HIGH-DADDY', 'Flying switch').
train_phrase('HIGH IRON', 'Main line or high-speed track (which is laid with heavier rail than that used on unimportant branches or spurs)').
train_phrase('HIGH LINER', 'Main-line fast passenger train').
train_phrase('HIGH-WHEELER', 'Passenger engine or fast passenger train. Also highball artist').
train_phrase('HIKER', 'A lineman who "hikes sticks" instead of prosaically climbing poles').
train_phrase('HIT ''ER', 'Work an engine harder. (Probably a variation of "hit the ball," which means "Get busy-no more fooling!")').
train_phrase('HIT THE GRIT or GRAVEL', 'Fall off a car or locomotive or get kicked off').
train_phrase('HOBO', 'Tramp. Term is said to have originated on Burlington Route as a corruption of "Hello, boy!" which construction workers used in greeting one another').
train_phrase('HOG', 'Any large locomotive, usually freight. An engineer may be called a hogger, hoghead, hogmaster, hoggineer, hog jockey, hog eye, grunt, pig-mauler, etc. Some few engineers object to such designations as disrespectful, which they rarely are. For meaning of hog law see dogcatchers. Hoghead is said to have originated on the Denver & Rio Grande in 1887, being used to label a brakeman''s caricature of an engineer').
train_phrase('HOLDING HER AGAINST THE BRASS', 'Running electric car at full speed').
train_phrase('HOLE', 'Passing track where one train pulls in to meet another').
train_phrase('HOME GUARD', 'Employee who stays with one railroad, as contrasted with boomer. A homesteader is a boomer who gets married and settles down').
train_phrase('HOOK', 'Wrecking crane or auxiliary').
train_phrase('HOOK ''ER UP AND PULL HER TAIL', 'To set the reverse lever up on the quadrant and pull the throttle well out for high speed').
train_phrase('HOPPER', 'Steel-sided car with a bottom that opens to allow unloading of coal, gravel, etc.').
train_phrase('HOPTOAD', 'Derail').
train_phrase('HORSE ''ER OVER', 'Reverse the engine. This is done by compressed air on modern locomotives, but in early days, manually operated reversing equipment required considerable jockeying to reverse an engine while in motion').
train_phrase('HOSE COUPLER', 'Brakeman who handles trains by himself with the road engine around a big passenger terminal').
train_phrase('HOSTLER', 'Any employee (usually a fireman) who services engines, especially at division points and terminals. Also called ashpit engineer').
train_phrase('HOT', 'Having plenty of steam pressure (applied to locomotives)').
train_phrase('HOT-FOOTER', 'Engineer or conductor in switching service who is always in a hurry').
train_phrase('HOT JEWEL', 'Same as hotbox').
train_phrase('HOT-WATER BOTTLE', 'Elesco feed water heater').
train_phrase('HOT WORKER', 'Boilermaker who repairs leaks in the firebox or flue sheet while there is pressure in the boiler').
train_phrase('HOTBOX', 'Overheated journal or bearing. Also called hub. This was a frequent cause of delay in the old days but is virtually nonexistent on trains that are completely equipped with ball-bearings. Trainmen are sometimes called hotbox detectors').
train_phrase('HOTSHOT', 'Fast train; frequently a freight made up of merchandise and perishables. Often called a manifest or redball run').
train_phrase('HOW MANY EMS HAVE YOU GOT? ', 'How many thousand pounds of tonnage is your engine pulling? (M stands for 1,000)').
train_phrase('HUMP', 'Artificial knoll at end of classification yard over which cars are pushed so that they can roll on their own momentum to separate tracks. (See drop.) Also the summit of a hill division or the top of a prominent grade. Boomers generally referred to the Continental Divide as the Hump').
train_phrase('HUMPBACK JOB', 'Local freight run. (Conductor spends much time in caboose bending over his wheel reports)').
train_phrase('HUT', 'Brakeman''s shelter just back of the coal bunkers on the tender tank of engines operating through Moffat Tunnel. May also refer to caboose, locomotive cab, switchman''s shanty, or crossing watchman''s shelter').
train_phrase('IDLER', 'An unloaded flatcar placed before or after a car from which oversize machinery, pipe, or other material projects').
train_phrase('IN', 'A trainman who is at the home terminal and off duty is in').
train_phrase('IN THE CLEAR', 'A train is in the clear when it has passed over a switch and frog so far that another train can pass without damage').
train_phrase('IN THE COLOR', 'Train standing in the signal block waiting for a clear board').
train_phrase('IN THE DITCH', 'Wrecked or derailed').
train_phrase('IN THE HOLE', 'On a siding. (See hole.) Also in the lower berth of a Pullman, as contrasted with on the tot, in the upper berth').
train_phrase('INDIAN VALLEY LINE', 'An imaginary railroad "at the end of the rainbow," on which you could always find a good job and ideal working conditions. (Does not refer to the former twenty-one-mile railroad of that name between Paxton and Engels, Calif.) Boomers resigning or being fired would say they were going to the Indian Valley. The term is sometimes used to mean death or the railroader''s Heaven. (See Big Rock Candy Mountains)').
train_phrase('IND ICATORS', 'Illuminated signs on the engine and caboose that display the number of the train').
train_phrase('IRON or RAIL', 'Track. Single iron means single track').
train_phrase('IRON HORSE', 'Academic slang for locomotive').
train_phrase('IRON SKULL', 'Boilermaker. (Jim Jeffries, one-time champion prize fighter, worked as an iron skull for years)').
train_phrase('JACK', 'Locomotive. (A term often confused with the lifting device, hence seldom used)').
train_phrase('JACKPOT', 'Miscellaneous assortment of mail and parcels piled in the aisle of a baggage car and requiring removal before the mail in the stalls can be "worked"').
train_phrase('JAILHOUSE SPUDS', 'Waffled potatoes').
train_phrase('JAM BUSTER', 'Assistant yardmaster').
train_phrase('JAM NUTS', 'Doughnuts').
train_phrase('JANNEY', 'To couple; derived from the Janney automatic coupler').
train_phrase('JAWBONE SHACK', 'Switch shanty').
train_phrase('JAY ROD', 'Clinker hook').
train_phrase('JERK A DRINK', 'Take water from track pan without stopping train. From this came the word jerkwater, which usually means a locality serving only to supply water to the engines of passing trains; a Place other than a regular stop, hence of minor importance as jerkwater town, jerkwater college, etc.').
train_phrase('JERK-BY', 'See flying switch').
train_phrase('JERK SOUP', 'Same as jerk a drink').
train_phrase('JERRY', 'Section worker; sometimes applied to other laborers').
train_phrase('JEWEL', 'Journal brass').
train_phrase('JIGGER', 'Full tonnage of "dead" freight').
train_phrase('JIMMIES', 'Four-wheel coal or ore cars').
train_phrase('JITNEY', 'Four-wheel electric truck that carries baggage around inside a terminal. Also unregulated private automobile that carried passengers on public highways for 5-cent fare in direct competition with trolley cars').
train_phrase('JOHNSON BAR', 'Reverse lever on a locomotive. (See drop ''er down)').
train_phrase('JOIN THE BIRDS', 'Jump from moving engine or car, usually when a wreck is imminent').
train_phrase('JOINT', 'A length of rail, generally 33 or 39 feet. Riding to a joint is bringing cars together so that they couple').
train_phrase('JOKER', 'In dependent or locomotive brake, part of E-T (engine-train) equipment').
train_phrase('JUGGLER', 'Member of way-freight crew who loads and unloads LCL freight at station stops').
train_phrase('JUGGLING THE CIRCLE', 'Missing a train-order hoop').
train_phrase('JUICE', 'Electricity. Juice fan is one who makes a hobby out of electric railways (juice lines)').
train_phrase('JUNK PILE', 'Old worn-out locomotive that is still in service.').
train_phrase('KANGAROO COURT', 'An official hearing or investigation, so named because it may be held wherever most convenient, anywhere along the road, jumping around like a kangaroo, to act on main-line mixups or other urgent problems').
train_phrase('KEELEY', 'Water can for hot journals or bearings. Nickname derived from "Keeley cure" for liquor habit').
train_phrase('KETTLE', 'Any small locomotive, especially an old, leaky one. Also called teakettle and coffeepot').
train_phrase('KEY', 'Telegraph instrument').
train_phrase('KICK', 'See drop').
train_phrase('KICKER', 'Triple valve in defective order, which throws air brakes into emergency when only a service application is intended, or sometimes by a bump of the train').
train_phrase('KING', 'Freight conductor or yardmaster. King snipe is foreman of track gang. King pin is conductor').
train_phrase('KITCHEN', 'Caboose; engine cab. Firebox is kitchen stove').
train_phrase('KNOCK HER IN THE HEAD', 'Slow Down').
train_phrase('KNOCKOUT', 'Same as bump').
train_phrase('KNOWLEDGE BOX', 'Yardmaster''s office; president of the road').
train_phrase('LADDER', 'Main track of yard from which individual tracks lead off. Also called a lead. (See yard)').
train_phrase('LAPLANDER', 'Passenger jostled into someone else''s lap in crowded car').
train_phrase('LAST CALL, LAST TERMINAL, etc', 'Death').
train_phrase('LAY-BY', 'Passing track, sidetrack. Layed out is delayed').
train_phrase('LAY OVER', 'Time spent waiting for connection with other train').
train_phrase('LCL', 'Less than carload lots of freight').
train_phrase('LETTERS', 'Service letters given to men who resign or are discharged. Applicants for railroad jobs are usually asked to present letters proving previous employment. In the old days, when these were too unfavorable, many boomers used faked letters or would work under a flag on somebody else''s certificates').
train_phrase('LEVER JERKER', 'Interlocker lever man').
train_phrase('LIBRARY', 'Cupola of caboose. Trainman occupying it was sometimes known as a librarian').
train_phrase('LIFT TRANSPORTATION', 'Collect tickets').
train_phrase('LIGHT ENGINE', 'An engine moving outside the yard without cars attached').
train_phrase('LIGHTNING SLINGER', 'Telegraph operator').
train_phrase('LINER', 'Passenger train').
train_phrase('LINK AND PIN', 'Old-time type of coupler; used to denote oldfashioned methods of railroading').
train_phrase('LIZARD SCORCHER', 'Dining-car chef').
train_phrase('LOADS', 'Loaded freight cars').
train_phrase('LOCAL LOAD', 'A truckload of mail in sacks and parcels sent from the storage car direct to a car on a local train, containing mail for towns along the route of the train').
train_phrase('LOUSE CAGE', 'Caboose').
train_phrase('LUNAR WHITE', 'The color of white used on all switches except on main line').
train_phrase('LUNCH HOOKS', 'Your two hands').
train_phrase('LUNG', 'Drawbar or air hose').
train_phrase('LUNG DOCTOR', 'Locomotive engineer who pulls out drawbars. Also lung specialist').
train_phrase('MADHOUSE', 'Engine foreman; scene of unusual activity or confusion MAIN IRON-Main track. Also called main stem MAIN PIN-An official MAKE A JOINT-Couple cars MANIFEST-Same as hotshot MARKERS-Signals on rear of train, flags by day and lamps by night MASTER MANIAC-Master mechanic, often abbreviated M.M. Oil is called master mechanic''s blood').
train_phrase('MASTER MIND', 'An official').
train_phrase('MATCHING DIALS', 'Comparing time').
train_phrase('MAUL', 'Work an ''engine with full stroke and full throttle').
train_phrase('MEAT RUN', 'Fast run of perishable freight, hotshot').
train_phrase('MEET ORDER', 'Train order specifying a definite location where two or more trains will meet on a single track, one on a siding, the others on the high iron').
train_phrase('MERRY-GO-ROUND', 'Turntable').
train_phrase('MIDDLE MAN, MIDDLE SWING', 'Second brakeman on freight train').
train_phrase('MIKE', 'Mikado-type engine (2-8-2), so named because first of this type were built for Imperial Railways of Japan. (Because of the war with Japan, some railroads rechristened this type MacArthur)').
train_phrase('MILEAGE HOG', 'Engineer or conductor, paid on mileage basis, who uses his seniority to the limit in getting good runs, which younger men resent').
train_phrase('MILK TRUCK', 'Large hand truck with high cast-iron wheels used to transfer milk cans around in a terminal').
train_phrase('MILL', 'Steam locomotive, or typewriter').
train_phrase('MIXED LOAD', 'Truckload of mail sacks and parcels for many destinations sent from storage car to the yard (an outside platform) for further separation before forwarding').
train_phrase('MONKEY', 'When a crew has been on duty sixteen hours and is caught out on the road, the monkey gets them and they are required by ICC rules to tie -up until a new crew comes. (See dogcatchers)').
train_phrase('MONKEY MONEY', 'The pass of a passenger who is riding free').
train_phrase('MONKEY MOTION', 'Walschaert or Baker valve gear on locomotive. Monkey house is caboose. Monkey suit is passenger trainman''s uniform or any other smart-looking uniform. Monkey tail is back-up hose').
train_phrase('MOONLIGHT MECHANIC', 'Night roundhouse foreman').
train_phrase('MOPPING OFF', 'Refers to escaping steam').
train_phrase('MOTHER HUBBARD', 'See Camelback').
train_phrase('MOTOR', 'Electric locomotive').
train_phrase('MOUNTAIN PAY', 'Overtime').
train_phrase('MOVING DIRT', 'Fireman shoveling coal into firebox').
train_phrase('MOVING SPIRIT', 'Train dispatcher, more often called DS').
train_phrase('MTYS', 'Empty cars').
train_phrase('MUCKERS', 'Excavators in construction work').
train_phrase('MUD CHICKENS', 'Surveyor. Mudhop is yard clerk, mudshop his office').
train_phrase('MUD SUCKER', 'A nonlifting injector').
train_phrase('MUDHEN', 'A saturated locomotive, one that is not superheated').
train_phrase('MULE SKINNER', 'Driver of mule cart').
train_phrase('MUSIC MASTER', 'Paymaster').
train_phrase('MUTT AND JEFF PUMP', 'Denver & Rio Grande locomotive with big air pump on right and small one on left').
train_phrase('MUZZLE LOADER', 'Hand-fired locomotive').
train_phrase('NEWS BUTCHER', 'Peddler who sells magazines, candy, fruit, ''etc., in trains. Usually employed nowadays by Union News Co. Thomas A. Edison, the inventor, was a news butcher in his youth and became deaf when a conductor boxed his ears for accidentally starting a fire while experimenting in a baggage car near Smith Creek, Mich.').
train_phrase('NICKEL GRABBER', 'Streetcar conductor').
train_phrase('19 ORDER', 'Train order that does not have to be signed for. Operator can hand it on a hoop or delivery fork as the train slows down. (See 31 order)').
train_phrase('99', 'Failure to protect your train or to flag it').
train_phrase('NO-BILL', 'Nonunion or nonbrotherhood railroad worker. Also called nonair').
train_phrase('NOSE ON', 'Couple on with head end of engine').
train_phrase('NOSEBAG', 'Lunch carried to work. Put on the nosebag means to eat a meal').
train_phrase('NUMBER DUMMY', 'Yard clerk or car clerk; also called number grabber').
train_phrase('NUT SPLITTER or NUT BUSTER', 'Machinist').
train_phrase('OILCAN', 'Tank car').
train_phrase('OLD GIRL', 'Affectionate term for steam engine').
train_phrase('OLD HAND', 'Experienced railroader. Also called old head').
train_phrase('OLD HEAD', 'Lots of Seniority').
train_phrase('OLD MAN', 'Superintendent or general manager').
train_phrase('OLE HOSS', 'Salvage warehouse, or freight on hand').
train_phrase('ON THE ADVERTISED', 'According to schedule; right on time. Often called on the card (timecard) and sometimes on the cat hop').
train_phrase('ON THE CARPET', 'Commoner version of dancing on the carpet').
train_phrase('ON THE GROUND', 'On the ties, as a derailed train').
train_phrase('ON THE SPOT', 'See spot').
train_phrase('OP', 'Telegraph operator').
train_phrase('OPEN-AIR NAVIGATOR', 'Hobo riding freight on top').
train_phrase('OPEN THE GATE', 'Switch a train onto or off a siding. Close the gate means to close the switch after the train has passed it').
train_phrase('O.R.C. ', 'Conductor. (See big O)').
train_phrase('ORDER BOARD', 'See board').
train_phrase('OS', 'On (train) sheet; to report a train by to dispatcher').
train_phrase('OUT', 'When a trainman is at a point other than his home terminal, either on or off duty, he is out').
train_phrase('OUTLAWED', 'See dogcatchers').
train_phrase('OVER THE KNOLL', 'Getting up the hill').
train_phrase('OVERLAP', 'Where two block signals control the same stretch of track OWL-Streetcar or train that runs late at night; almost anything having to do with night').
train_phrase('PADDLE', 'Semaphore signal').
train_phrase('PADDLE WHEEL', 'Narrow-gauge locomotive with driving boxes outside of the wheels').
train_phrase('PAIR OF PLIERS', 'Conductor''s punch').
train_phrase('PALACE', 'Caboose').
train_phrase('PAPER CAR', 'Baggage car for the transportation of newspapers exclusively').
train_phrase('PAPERWEIGHT', 'Railroad clerk, office worker. Also called pencil pusher').
train_phrase('PARLOR', 'Caboose. Parlor man or parlor maid is hind brakeman or flagman on freight train').
train_phrase('PASSING THE CROAKER', 'Being examined by company doctor').
train_phrase('PEAKED END', 'Head end of train. Also pointed or sharp end').
train_phrase('PEANUT ROASTER', 'Any small steam engine').
train_phrase('PECK', 'Twenty minutes allowed for lunch').
train_phrase('PEDDLE', 'To set out freight cars').
train_phrase('PEDDLER', 'Local way-freight train').
train_phrase('PELICAN POND', 'Place outside a roundhouse (down South) where there is much ooze and slime, caused by the fact that many locomotives are run thirty days without the boilers being washed out. The boilers are kept clean by blowing them out with blowoff cocks').
train_phrase('PENNSYLVANIA', 'Coal').
train_phrase('PERSUADER', 'Blower (for locomotive fire)').
train_phrase('PETTICOAT', 'Portion of the exhaust stack that guides exhausted steam into the stack proper. When this becomes displaced, the spent steam goes back through the flues, cutting off the draft from the fire').
train_phrase('PIE-CARD', 'Meal ticket. Also called grazing ticket').
train_phrase('PIG', 'Locomotive. Pig-mauler is locomotive engineer; pigpen locomotive roundhouse. (See hog)').
train_phrase('PIKE', 'Railroad').
train_phrase('PIN AHEAD AND PICK UP TWO BEHIND ONE', 'Cut off the engine, pick up three cars from siding, put two on the train, and set the first one back on the siding').
train_phrase('PIN FOR HOME', 'Go home for the day').
train_phrase('PINHEAD', 'Brakeman. Pin-lifter is yard brakeman. Pinner is a switchman that follows. Pin-puller is a switchman that cuts off cars from a train. The old-style link-and-pin coupler (now rarely used) was called Lincoln pin').
train_phrase('PINK', 'Caution card or rush telegram').
train_phrase('PLANT', 'Interlocking system').
train_phrase('PLUG', '"One-horse" passenger train. Also throttle of old-style locomotive; hence engineers were known as plug-pullers. Plugging her means using the reverse lever as a brake instead of the air. Local passenger trains are sometimes referred to as Plug runs').
train_phrase('PLUSH RUN', 'Passenger train').
train_phrase('POCATELLO YARDMASTER', 'Derisive term for boomers, all of whom presumably claimed to have held, at some time, the tough job of night yardmaster at Pocatello, Idaho').
train_phrase('POLE', 'To run light. (See light)').
train_phrase('POLE PIN', 'Superintendent of telegraph').
train_phrase('POP', 'To let safety valve on boiler release, causing waste of steam, making a loud noise, and, when engine is working hard, raising water in boiler, thereby causing locomotive to work water').
train_phrase('POP CAR', 'Gasoline car or speeder, used by section men, linemen, etc.; so called because of the put-put noise of its motor exhaust').
train_phrase('POPS', 'Retainers').
train_phrase('POSITIVE BLOCK', 'Locomotive engineer').
train_phrase('POSSUM BELLY', 'Toolbox under a caboose or under some wrecking cars').
train_phrase('POUND HER', 'Work a locomotive to its full capacity').
train_phrase('POUNDING THEIR EARS', 'Sleeping, making hay').
train_phrase('PUD', 'Pick up and delivery service').
train_phrase('PULLER', 'Switch engine hauling cars from one yard to another at the same terminal. Also the operator of an electric truck that transfers baggage and mail around a terminal').
train_phrase('PULL FREIGHT', 'To leave or to give up a job').
train_phrase('PULL THE AIR', 'Set brakes by opening conductor''s valve or angle cock').
train_phrase('PULL THE CALF''S TAIL', 'Yank the whistle cord').
train_phrase('PULL THE PIN', 'Uncouple a car by pulling up the coupling pin. A boomer expression meaning to resign or quit a job').
train_phrase('PURE-FOOD LAW', 'See dogcatchers').
train_phrase('PUSHER', 'Extra engine on rear of train, usually placed there to assist in climbing a grade').
train_phrase('PUSSYFOOTER', 'Railroad policeman').
train_phrase('PUT ''ER ON', 'Make a reduction in air in the train''s braking system. Put ''er all on means apply emergency brake, more commonly described as big-holing her').
train_phrase('PUT ON THE NOSEBAG', 'Eat a meal').
train_phrase('QUILL', 'Whistle (term used especially in the South)').
train_phrase('QUILLING', 'Personalized technique of blowing a locomotive whistle, applicable only in the days before the whistles became standardized').
train_phrase('RABBIT', 'A derail; an arrangement for preventing serious wrecks by sidetracking runaway trains, cars, or locomotives on a downgrade. Unlike regular sidetracks, the derail ends relatively abruptly on flat trackless land instead of curving back onto the main line. The term rabbit is applied to this device because of the timidity involved').
train_phrase('RACE TRACK', 'Straight and flat stretch of track upon which an engineer can safely make unusually high speed. Also parallel stretches of track of two competing railroads upon which rival trains race one another (contrary to company rules but much to the delight of enginemen, trainmen, and passengers, and perhaps to the secret delight of some officials)').
train_phrase('RAG-WAVER', 'Flagman').
train_phrase('RAIL', 'Any railroad employee').
train_phrase('RAILFAN', 'Anyone who makes a hobby of railroading').
train_phrase('RAP THE STACK', 'Give your locomotive a wide-open throttle, make more speed. Rapper is an engineer who works his engine too hard').
train_phrase('RATTLE HER HOCKS', 'Get speed out of an engine').
train_phrase('RATTLER', 'Freight train').
train_phrase('RAWHIDER', 'Official, or any employee, who is especially hard on men or equipment, or both, with which he works. A rawhider, or slave driver, delights in causing someone to do more than his share of work. Running too fast when picking up a man on the footboard, or making a quick stop just short of him when he is expecting to step on, so that he has to walk back, are two ways it is done; but there are almost as many ways of rawhiding as there are different situations').
train_phrase('REAL ESTATE', 'Poor coal mixed with dirt or slag. When mixed with sand it is called seashore').
train_phrase('RED BOARD', 'Stop signal').
train_phrase('REDBALL, BALL OF FIRE', 'Fast freight train,').
train_phrase('REDCAP', 'Station porter. Term coined about 1900 by George H. Daniels, New York Central publicist').
train_phrase('RED EYE', 'Same as red board; also liquor').
train_phrase('RED ONION', 'Eating house or sleeping quarters for railroad men').
train_phrase('REEFER or RIFF', 'Refrigerator car').
train_phrase('REPTILE', 'See snake').
train_phrase('RETAINER', 'Small valve located near brake wheel for drawing off and holding air on cars. (Retainers often figure prominently in true tales and fiction stories about runaway cars on trains)').
train_phrase('RIDIN'' ''EM HIGH', 'Traveling on tops of boxcars').
train_phrase('RIDIN'' THE RODS', 'An old-time hobo practice, now virtually obsolete. The hobo would place a board across truss rods under a car and ride on it. This was very dangerous even in pleasant weather, and the possibility was ever present that you might doze, get careless, become too cramped, or lose your nerve-and roll under the wheels').
train_phrase('RIDING THE POINT', 'Riding a locomotive, point referring to shape of pilot').
train_phrase('RIGHT-HAND SIDE', 'Engineer''s side of cab (on nearly all North American roads). Left-hand side is fireman''s side. When a fireman is promoted he is set up to the right-hand side').
train_phrase('RINGMASTER', 'Yardmaster').
train_phrase('RIPRAP', 'Loose pieces of heavy stone or masonry used in some places to protect roadbeds from water erosion').
train_phrase('RIP-TRACK', 'Minor repair track or car-repair department. RIP means repair').
train_phrase('RIVET BUSTER', 'Boilermaker').
train_phrase('ROAD HOG', 'Any large motor vehicle on a highway, especially intercity trailer trucks and busses that cut into railroad freight and passenger revenue').
train_phrase('ROOFED', 'Caught in close clearance').
train_phrase('ROOF GARDEN', 'Mallet-type locomotive or any helper engine on a mountain job. Sometimes called sacred ox').
train_phrase('ROUGHNECK', 'Freight brakeman').
train_phrase('RUBBERNECK CAR', 'Observation car').
train_phrase('RULE G', '"The use of intoxicants or narcotics is prohibited" - one of twelve general rules in standard code adopted by Association of American Railroads, based upon previous regulations made by individual companies. Countless thousands of railroad men, especially boomers, have been discharged for violation of Rule G; not because of railroads'' objection to liquor itself but because a man under the influence of liquor is not to be trusted in a job involving human lives and property').
train_phrase('RUN', 'The train to which a man is assigned is his run').
train_phrase('RUN-AROUND', 'If it is a man''s turn to work and he is not called, he may claim pay for the work he missed. He has been given the run-around').
train_phrase('RUN-IN', 'A collision; an argument or fight').
train_phrase('RUN LIGHT', 'For an engine to run on the tracks without any cars').
train_phrase('RUNNER', 'Locomotive engineer').
train_phrase('RUNT', 'Dwarf signal').
train_phrase('RUST or STREAK O'' RUST', 'Railroad').
train_phrase('RUST PILE', 'Old locomotive').
train_phrase('RUSTLING THE BUMS', 'Searching a freight train for hobos. In bygone days it was common practice for trainmen to collect money from freight-riding ''bos, often at the rate of a dollar a division').
train_phrase('SADDLE', 'First stop of freight car, under the lowest grab iron').
train_phrase('SANDHOG', 'Laborer who works in a caisson tunneling under a river, boring either a railroad tunnel, subway, or highway tunnel').
train_phrase('SAP', 'Same as brake club; also called the staff of ignorance. To set hand brakes is to sap up some binders').
train_phrase('SAWBONES', 'Company doctor').
train_phrase('SAW BY', 'Slow complicated operation whereby one train passes another on a single-track railroad when the other is on a siding too short to hold the entire train. Saw by is applied to any move through switches or through connecting switches that is necessitated by one train passing another').
train_phrase('SCAB', 'Nonunion workman; also car not equipped with automatic air system. (See nonair)').
train_phrase('SCIZZOR-BILL', 'Uncomplimentary term referring to yard or road brakemen and students in train service').
train_phrase('SCOOP', 'Fireman''s shovel. Also the step on front and rear ends of switch engines').
train_phrase('SCOOT', 'Shuttle train').
train_phrase('SCRAP PILE', 'Worn-out locomotive that is still in service').
train_phrase('SEAT HOG', 'Passenger who monopolizes more than one seat in a car or station waiting room while others are standing. Such pests usually spread luggage, packages, or lunch over adjacent seats').
train_phrase('SEASHORE', 'Sand used in sand dome. Also applied to coal that is mixed with sand').
train_phrase('SECRET WORKS', 'Automatic air-brake application. Also the draft timbers and drawbar of a car, when extracted by force. If only the drawbar is pulled out, you say, "We got a lung," but if the draft timbers comewith it, you say, "We got the whole damn secret works"').
train_phrase('SENIORITY GRABBER', 'Railroad employee who is glad when someone above him dies, gets killed, is fired, or resigns, so he can move up the seniority list to a better job').
train_phrase('SEPARATION', 'The sorting of mail sacks and parcels within the storage car before transferring to trucks').
train_phrase('SERVICE APPLICATION', 'Gradual speed reduction, as contrasted with emergency stop caused by wiping the clock').
train_phrase('SETTING UP', 'Loading a baggage car with mail and parcels according to a prearranged plan to facilitate rapid unloading at various stations along the line').
train_phrase('SETUP', 'Four to six hand trucks placed in formation beside the door of a storage car to facilitate the separation of the mail and parcels being unloaded. Each truck is loaded with matter to be transferred to other trains or to the R.P.O. (Railway Post Office) terminal office').
train_phrase('SHACK', 'Brakeman, occupant of caboose. Shacks master is a conductor SHAKE ''EM UP-Switching').
train_phrase('SHAKING THE TRAIN', 'Putting on air brakes in emergency').
train_phrase('SHANTY', 'Caboose').
train_phrase('SHINER', 'Brakeman''s or switchman''s lantern').
train_phrase('SHINING TIME', 'Starting time (probably from old Negro spiritual "Rise and Shine")').
train_phrase('SHOO-FLY', 'Temporary track, usually built around a flooded area, a wreck, or other obstacle; sometimes built merely to facilitate a rerailing').
train_phrase('SHORT FLAGGING', 'Flagman not far enough from his train to protect it. (See drawbar flagging)').
train_phrase('SHORT LOADS', 'Cars consigned to points between division points and set out on sidings at their destinations. Also called shorts').
train_phrase('SHORT-TIME CREW', 'Crew working overtime but not yet affected by the sixteen-hour law. (See dogcatchers)').
train_phrase('SHUFFLE THE DECK', 'Switch cars onto house tracks at every station you pass on your run').
train_phrase('SHUNTING BOILER', 'Switch engine').
train_phrase('SIDE-DOOR PULLMAN', 'Boxcar used by hobos in stealing rides').
train_phrase('SKATE', 'Shoe placed on rail in hump yard to stop cars with defective brakes').
train_phrase('SKIN YOUR EYE', 'Engineer''s warning to man on left side of cab when approaching curve').
train_phrase('SKIPPER', 'Conductor').
train_phrase('SKYROCKETS', 'Red-hot cinders from smokestack').
train_phrase('SLAVE DRIVER', 'Yardmaster. Also any rawhider').
train_phrase('SLING MORSE', 'Work as telegraph operator').
train_phrase('SLIPS, CAR OR TRAIN OF', 'Car or train of bananas').
train_phrase('SLOW BOARD', 'See board').
train_phrase('SLUG', 'Heavy fire in locomotive firebox').
train_phrase('SLUGS', 'A shipment of magazines, catalogues, or automobile-license plates in small mail sacks weighing approximately 100 pounds each').
train_phrase('SMART ALECK', 'Passenger conductor').
train_phrase('SMOKE or SMOKE AGENT', 'Locomotive fireman. Smoker is engine or firebox. Smoking ''em or running on smoke orders is a dangerous method, now obsolete, of running a train from one station or siding to another without orders from the dispatcher. You moved cautiously, continually watching for the smoke of any train that might be approaching you on the same track').
train_phrase('SNAKE', 'Switchman, so named from the large serpentine letter S on membership pins of the Switchman''s Union of North America. Sometimes called reptile or serpent').
train_phrase('SNAKEHEAD', 'A rail that comes loose from the ties and pierces the floor of a car; a fairly common accident with the strap-iron rails of a century ago').
train_phrase('SNAP', 'Push or pull with another engine. Snapper is the engine that does the pulling').
train_phrase('SNIPE', 'Track laborer. His boss is a king snipe').
train_phrase('SNOOZER', 'Pullman sleeping car').
train_phrase('SNUFF DIPPERS', 'Coal-burning engines that burn lignite (which, on the Missouri Pacific at least, is the same color as snuff)').
train_phrase('SOAK', 'Saturated locomotive').
train_phrase('SODA JERKER', 'Locomotive fireman').
train_phrase('SOFT BELLIES', 'Wooden frame cars').
train_phrase('SOFT-DIAMOND SPECIAL', 'Coal train').
train_phrase('SOFT PLUG', 'Fusible plug in crown sheet of locomotive that is supposed to drop when water gets below top of sheet').
train_phrase('SOLID CAR', 'A completely filled storage car containing sixty feet of mail and parcels, equal to a 100 per cent load').
train_phrase('SOLID TRACK', 'Track full of cars').
train_phrase('SPAR', 'Pole used to shove cars into the clear when switching. (See stake)').
train_phrase('SPEED GAUGER', 'Locomotive engineer').
train_phrase('SPEEDER', 'Same as pop car').
train_phrase('SPEEDY', 'Callboy').
train_phrase('SPIKE A TORCH', 'Throw a fusee').
train_phrase('SPOT', 'To place a car in a designated position. Also sleep, rest, or lunch period on company time. On the spot means an opportunity for railroad men to "chew the rag" or swap experiences. Unlike the same underworld term, on the spot has no sinister implication in railroad slang').
train_phrase('SPOTBOARD', 'Guide used by section men in surfacing or ballasting track in order to obtain an even bed.').
train_phrase('SPOTTER', 'Spy, company man assigned to snoop around and check on employees').
train_phrase('SQUEEZERS', 'Car-retarding system used in some railroad yards').
train_phrase('SQUIRRELING', 'Climbing a car').
train_phrase('STACK O'' RUST', 'A locomotive that has seen better days').
train_phrase('STAKE', 'Pole used in dangerous and now rare method of switching. A cut of cars was shoved by a stake attached to the car immediately in front of the engine. This method was supposed to be superior to the ordinary method of "batting them out" because there was less wear and tear on drawbars and less damage to freight; but the human casualties that resulted gave more than one yard the nickname "slaughterhouse." Another meaning of stake is the money a boomer saved on a job so he could resign and continue eating regularly while looking for another job').
train_phrase('STAKE DRIVER', 'Any engineering-department man').
train_phrase('STALL', 'Space inside a mail or baggage car containing mail or parcels consigned to a certain destination and separated from other shipments by removable steel posts').
train_phrase('STARGAZER', 'Brakeman who fails to see signals').
train_phrase('STARVATION DIET', 'See board').
train_phrase('STEM', 'Track or right-of-way').
train_phrase('STEM-WINDER', 'Climax type of geared locomotive. Also applied to trolley car without brakes because of the motion of its brake handle').
train_phrase('STICK', 'Staff used on certain stretches of track to control the block. It is carried by engine crews from one station to another. Now rare').
train_phrase('STIFF BUGGY', 'Specially designed four-wheel truck used for transferring coffins and rough boxes inside a station').
train_phrase('STINGER', 'Brakeman. Derived from initial B(ee) of Brotherhood of Railroad Trainmen, or perhaps from some brakemen''s habit of arousing hobos by applying a brake club to the soles of their shoes').
train_phrase('STINK BUGGY', 'Bus').
train_phrase('STINKER', 'Hotbox').
train_phrase('STIRRUP', 'First step of freight car, under the lowest grab iron').
train_phrase('STOCK PEN', 'Yard office').
train_phrase('STOCKHOLDER', 'Any employee who is always looking out for the company''s interests').
train_phrase('STOPPER PULLER', 'Member of the crew that follows the engine in switching').
train_phrase('STORAGE CAR', 'Baggage car or (in rush periods) Railway Express car containing a mixed shipment of parcels and mail sacks consigned to a certain terminal for sorting and rerouting to various destinations via other trains').
train_phrase('STRAW BOSS', 'Foreman of small gang or acting foreman').
train_phrase('STRAW-HAT BOYS', 'Railroad men who work only in pleasant weather').
train_phrase('STRAWBERRY PATCH', 'Rear end of caboose by night; also railroad yard studded with red lights').
train_phrase('STRETCH ''EM OUT', 'Take out slack in couplings and drawbars of train').
train_phrase('STRING', 'Several cars coupled together; also a telegraph wire').
train_phrase('STRUGGLE FOR LIFE', 'Existence in railroad boardinghouse').
train_phrase('STUDE TALLOW', 'Student fireman').
train_phrase('STUDENT', 'Learner in either telegraph, train, or engine service; an apprentice').
train_phrase('SUCK IT BY', 'Make a flying switch').
train_phrase('SUGAR', 'Sand').
train_phrase('SUPER', 'Superintendent').
train_phrase('SWELLHEAD', 'Conductor or locomotive engineer').
train_phrase('SWING A BUG', 'Make a good job of braking. (See bug)').
train_phrase('SWING MAN', 'Same as middle man').
train_phrase('SWITCH LIST', 'Bill of fare at railroad eating house').
train_phrase('SWITCH MONKEY', 'Switchman').
train_phrase('TAIL OVER HER BACK', 'Engine with full head of steam, with plume resembling a squirrel''s tail from her safety valve').
train_phrase('TAKE THE RUBBER OUT OF THEM', 'Disconnect the air hoses on a train').
train_phrase('TAKING YOUR MINUTES', 'Stopping for lunch').
train_phrase('TALLOWPOT', 'Locomotive fireman, so called from melted tallow used to lubricate valves and shine the engine').
train_phrase('TANK', 'Locomotive tender. Tanker is tank car used in hauling oil, water, milk, chemicals or some other liquid').
train_phrase('TEAKETTLE', 'See kettle').
train_phrase('TEASE THE BRUTE', 'Follow the engine').
train_phrase('TELLTALES', 'Any device that serves as a warning. Specifically the row of strips hanging down a short distance in front of a tunnel or low bridge to inform trainmen who are riding car tops that they''d better duck').
train_phrase('TEMPLE OF KNOWLEGE', 'Term for caboose').
train_phrase('TERMINAL', 'Railway Post Office unit, usually at or near the railroad station, where mail is removed from sacks, sorted, and forwarded to its ultimate destination').
train_phrase('TERMINAL LOAD', 'A shipment of mail consigned to a certain R.P.O. terminal office for sorting and reshipment in other sacks').
train_phrase('THE BISCUITS HANG HIGH', 'There''s a scarcity of food handouts in that locality').
train_phrase('THIRTY', 'Telegraphic term for "that''s all-no more"').
train_phrase('31 ORDER', 'Train order that must be signed for; the train must stop to pick it up. (See 19 order)').
train_phrase('THOUSAND-MILER', 'Black satin or blue percale shirt worn by railroaders, expected to last 1,000 miles between washings. (The usual basis of a day''s work was about 10 0 miles, so two shirts could easily last from one pay day to the next)').
train_phrase('THREE-BAGGER', 'Train pushed or pulled by three engines. (No doubt originated by a baseball fan)').
train_phrase('THROTTLE-JERKER', 'Engineer').
train_phrase('THROTTLE GOD', 'Loc.Engineer)').
train_phrase('THROW AWAY THE DIAMONDS', 'Term applied to locomotive fireman missing the firedoor with a shovelful of coal and spilling some').
train_phrase('THROW OUT THE ANCHOR', 'Done for the Day').
train_phrase('TIE ''EM DOWN', 'Set handbrakes').
train_phrase('TIE ON', 'Couple on. Tie ''em together is to couple cars').
train_phrase('TIE UP', 'Stop for a meal or for rest').
train_phrase('TIER', 'Pile of mail sacks or parcels occupying the full width at each end of a car').
train_phrase('TIMKENIZED', 'Equipped with Timken roller bearings').
train_phrase('TIN LIZARD', 'Streamlined train').
train_phrase('TING-A-LING', 'Small engine with "tinny" bell').
train_phrase('TISSUE', 'Train order. (See flimsy)').
train_phrase('TOAD', 'Derail. (See rabbit)').
train_phrase('TOEPATH or TOWPATH', 'Running board of locomotive or catwalk on top of boxcars, or that part of railroad embankment lying between end of ties and shoulders of fill').
train_phrase('TONK', 'Car repairer').
train_phrase('TONNAGE HOUND', 'Trainmaster or other official who insists upon longer or heavier trains than the crew and motive power can handle efficiently').
train_phrase('TOP DRESSER DRAWER', 'Upper bunk in caboose').
train_phrase('TOWER BUFF', 'Railfan so zealous that he disregards signs such as "Private," "No Admittance" and "Stay Out" on interlocking towers and other railroad structures').
train_phrase('TRAIN LINE', 'Pipe that carries compressed air to operate air brakes').
train_phrase('TRAMPIFIED', 'The way a boomer looked after being out of work a long time. His clothes were "ragged as a barrel of sauerkraut" and he needed a "dime''s worth of decency" (shave)').
train_phrase('TRAVELING CARD', 'Card given by a railroad Brotherhood to a man in search of employment. Also an empty slip bill').
train_phrase('TRAVELING GRUNT', 'Road foreman of engines, traveling engineer. Sometimes called traveling man').
train_phrase('TRICK', 'Shift, hours of duty').
train_phrase('TRIMMER', 'Engine working in hump yard that goes down into yard and picks out misdirected cars and shoves them to clear. (See yard and hump)').
train_phrase('TWO-WHEELER', 'Two-wheeled hand truck for transferring baggage and mail around in a station').
train_phrase('UNCLE SAM', 'Railway Post Office clerk').
train_phrase('UNDER THE TABLE', 'Just as a man who "can''t take his liquor" is sometimes actually under the table, so, figuratively, is a telegraph operator when messages are being sent to him faster than he can receive').
train_phrase('UNDERGROUND HOG', 'Chief engineer').
train_phrase('UNLOAD', 'Get off train hurriedly').
train_phrase('VARNISH', 'Passenger train. Also called varnished shot, varnished job, varnished boxes, string of varnish, varnished wagons, etc. These nicknames are rarely applied to modern streamliners').
train_phrase('VASELINE', 'Oil').
train_phrase('VOODOO BARGE', 'Updated Heavy,Slow Freight').
train_phrase('WABASH', 'To hit cars going into adjacent tracks. (See cornered) Also refers to the officially frowned-upon practice of slowing up for a stop signal at a crossing with another railroad instead of stopping. The engineer would look up and down to make sure everything is safe, then start up again, having saved several minutes by not stopping entirely. Wabash may also mean a heavy fire in the locomotive firebox').
train_phrase('WAGON', 'Railroad car. (English term)').
train_phrase('WALK THE DOG', 'Wheel a freight so fast as to make cars sway from side to side').
train_phrase('WALK UP AGAINST THE GUN', 'Ascend a steep grade with the injector on').
train_phrase('WALL STREET NOTCH', 'Forward corner of reverse lever quadrant in engine cab (more commonly called company notch). Called Wall Street notch because engine pays dividends when heaviness of train requires engine to be worked that way').
train_phrase('WASHOUT', 'Stop signal, waved violently by using both arms and swinging them in downward arc by day, or swinging lamp in wide low semicircle across tracks at night').
train_phrase('WATCH YOUR PINS', 'Be careful around stacks of ties, rails, etc.').
train_phrase('WAY CAR', 'Caboose, or car of local freight').
train_phrase('WEARING THE BLUE', 'Delayed by car inspectors. A blue flag or blue light is placed on cars thus delayed and being worked on').
train_phrase('WEARING THE GREEN', 'Carrying green signals. When trains run in more than one section, all except the last must display two green flags').
train_phrase('WEED BENDER', 'Railroaders'' derisive term for cowboy, other such terms being hay shaker, clover picker, and plow jockey. Commonest term for cowboy is cowpuncher, which is of railroad origin. Cowboys riding stock trains prod the cattle').
train_phrase('WEED WEASEL', 'Company Official Spying on Crews').
train_phrase('WESTINGHOUSE', 'Air brake, also called windjammer').
train_phrase('WET MULE IN THE FIREBOX', 'Bad job of firing a locomotive').
train_phrase('WHALE BELLY', 'Steel car, or type of coal car with drop bottom. Also called sow belly').
train_phrase('WHEEL ''EM', 'Let a train run without braking. Wheeling means carrying or hauling at good speed; also called highballing. You say wheeling the berries when you mean hauling the berry crop at high speed').
train_phrase('WHEEL MONKEY', 'Car inspector').
train_phrase('WHEN DO YOU SHINE? ', 'What time were you called for?').
train_phrase('WHISKERS', 'Quite a bit of seniority').
train_phrase('WHISTLE OUT A FLAG', 'Engineer blows one long and three short blasts for the brakeman to protect rear of train').
train_phrase('WHITE FEATHER', 'Plume of steam over safety valves, indicating high boiler pressure').
train_phrase('WHITE RIBBONS', 'White flags (an extra train)').
train_phrase('WHITEWASH', 'Milk').
train_phrase('WIDEN ON HER', 'Open the throttle, increase speed').
train_phrase('WIGWAG', 'A grade-crossing signal').
train_phrase('WILLIE', 'Waybill for loaded car').
train_phrase('WIND', 'Air brakes').
train_phrase('WING HER', 'Set brakes on moving train').
train_phrase('WISE GUY', 'Station agent').
train_phrase('WOLF or LONE WOLF', 'Nonbrotherhood man').
train_phrase('WORKING A CAR', 'Unloading a storage mail car').
train_phrase('WORKING MAIL', 'Mail in sacks and pouches consigned to R.P.O. (Railway Post Office) cars to be "worked" or sorted in transit').
train_phrase('WORK WATER', 'Some old-time engineers preferred to work the water (operate the injector and watch the water glass or gauge cocks). On most roads the fireman now works the water').
train_phrase('WRECKING CREW', 'Relief crew. Derogatory term derived from the difficulty regular men sometimes experience in rearranging a car after it has been used by relief men').
train_phrase('WRONG IRON', 'Main track on which the current of traffic is in the opposite direction').
train_phrase('WYE', 'Tracks running off the main line or lead, forming a letter Y; used for turning cars and engines where no urntable is available').
train_phrase('X', 'Empty car').
train_phrase('XXX', 'Same as bad order').
train_phrase('YARD', 'System of tracks for making up trains or storing cars. (Boomer''s version: "System of rust surrounded y fence and inhabited by a dumb bunch of natives who will not let a train in or out.") Also called garden and ield. Yard geese are yard switchmen. Y.M. is yardmaster. Yard goat is switching engine').
train_phrase('ZOO KEEPER', 'Gate tender at passenger station').
train_phrase('ZULU', 'Emigrant family with its household goods and farm equipment traveling by rail; sometimes included even livestock crowded into the same boxcar. Zulu can mean only the car, or the car and all its contents. This ethod of travel was not uncommon in homesteading days on Western prairies. Origin of term is obscure. May have some connection with the fact that British homesteaders in Africa fled in overfilled farm wagons before Zulu marauders').
