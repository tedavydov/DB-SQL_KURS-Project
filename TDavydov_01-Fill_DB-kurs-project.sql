/* Факультет Geek University Data Engineering
 *  Давыдов Теймураз
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *  База Данных ДатаЦентра
 *  Курсовой Проект
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

USE dc_journal;

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *  Наполнение данными 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * 
 * Все данные условны и не имеют привязки к реальному оборудованию !
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


-- таблица пользователей 
-- взяты данные, сгенерированные в ДЗ 4-го урока (CRUD-операции) с помощью сайта http://filldb.info/ 


INSERT INTO `users` (`firstname`, `lastname`, `email`, `password_hash`, `phone`) VALUES 
('Hipolito', 'Emard', 'scottie35@example.net', '1ec4c3f7a8da1e3366baa6a2d0f3529d9ec3a089', '154269'),
('Clark', 'Ryan', 'jerome.roberts@example.org', 'a486b6f17a623945c291fb4c0d8a83a96c58ec19', '134565'),
('Frida', 'Krajcik', 'veda.veum@example.net', '43ab78446ba5e87cd30045adfe10af38ce4cf0cc', '136365'),
('Marquise', 'Deckow', 'myra.klein@example.com', '80effd269912a5099da2aff57945b75ac1fece7a', '45656356356'),
('Cora', 'Macejkovic', 'barton.christophe@example.net', 'c46029872fc432d25b860aa256d2d8bb85a7f335', '56456456456'),
('Trevor', 'Abbott', 'glarson@example.com', '211a62a505b7ae6d33282cbc8f20c09312b2a7fa', '10051'),
('Grayce', 'Paucek', 'wintheiser.kris@example.org', '44589b77028f321a3b5068c472f1ef1c53caeabf', '773441'),
('Camren', 'Tromp', 'franecki.naomie@example.net', '0bf6b734540b7cd8950f3e8731b83345f163b6ae', '745352'),
('Nico', 'Schneider', 'baron.moen@example.org', '6e4820c44e7483465e1510effa6bab41996edd18', '34535346534'),
('Albina', 'Crona', 'o\'keefe.magnolia@example.net', '5d9e8875c3206a3c9e9056c318572ad1bd176fdb', '65365464564356'),
('Harmon', 'Turcotte', 'laurianne91@example.com', '348afe0564cbcef926fb41ff080f5d81bd8737d9', '36345345'),
('Mathilde', 'Franecki', 'corkery.karson@example.net', '343353cb76931dbce90d4a229c50dd55cb2e983c', '34345345345'),
('Stefanie', 'Parker', 'zdach@example.org', '5296747cb1611b4ef3ec93361a6e259f494a0646', '95234556456'),
('Elnora', 'Ortiz', 'yhoppe@example.org', 'e646899c2652527cc2b72c37e703ec2ccaad3f24', '729770'),
('Delilah', 'Hudson', 'dan43@example.net', '2c8379dd747e4607eed221fbab21e4f7fff669a0', '1111305000'),
('Hazel', 'McDermott', 'trantow.eleanore@example.org', '5f1a72b8105ec0064f63f3c7cfc38fe8cf0257b7', '155290'),
('Marcelina', 'Kirlin', 'yd\'amore@example.com', '16b9093b180cd6952acbdd3d6918fbf2c51c67fb', '456456456456'),
('Nia', 'Dooley', 'grady.lauren@example.org', 'fbfb4bb2e8d3d756329f0bc22f1fbbf98b0e6a7f', '546546'),
('Art', 'Hamill', 'caesar18@example.net', '7405913dc5c48502afe1ed9dea569e29e54e1a9c', '225984'),
('Larissa', 'Schroeder', 'triston.reinger@example.net', 'fc9cf04277afd3fecf933c7ef9eaf6b4af64bf8c', '695215'),
('Libby', 'Johnson', 'alexa.mclaughlin@example.net', '723806b768a9b58f637c1178cd6f883654ae40f1', '6355654647'),
('Steve', 'Wisozk', 'frederick.krajcik@example.com', 'e94a7f9c851873898723daaf3b2c0ead338d1071', '425555555'),
('Blanca', 'Koch', 'furman84@example.org', '7877c71ee31849e64f03a15e6ca7f25b10897ac8', '728761'),
('Kiarra', 'Shanahan', 'whagenes@example.org', 'b423c2651d31e04094e89270c77113530dee3420', '56456456456'),
('Jaydon', 'Pfannerstill', 'gkuphal@example.org', '42085653fb619dd312ddc6448cc363b150b6447a', '561664'),
('Virgil', 'Leffler', 'anita66@example.net', '46db39e28626cb950ffb085bdd0fafbc2b3df37b', '74565465466'),
('Zoie', 'Strosin', 'ruthe19@example.net', 'f38e5e05bb98146fe54d9426738113252cf24a00', '8345645642354'),
('Raymundo', 'Gaylord', 'beatty.cassie@example.net', 'f52933b9d413515eb1a6ec0b8b9ce8f6e6c3e4e2', '34534554666'),
('Diego', 'Bogan', 'yost.else@example.com', '8e8fca9c61f9383b1310bb90af7390b9c3f25d87', '675728'),
('Drew', 'Cruickshank', 'laron.dicki@example.org', 'aad4610d651f95cadebe7ca4ea52893086e1cfcd', '56655452354'),
('Krystina', 'Batz', 'hardy58@example.org', '05d491a2ce7ab336f00e88b68fa8e97d9dce72f7', '86546455555'),
('Anthony', 'Schiller', 'hintz.alaina@example.net', '656d7bc4c08e653e45d3241e2c0469963a15ac0c', '5555555555555'),
('Kayli', 'O\'Keefe', 'earnest46@example.net', 'e1c20970c25179fbe27f7638ee0de4428e153edc', '323454345345'),
('Rhett', 'Cormier', 'arturo.stiedemann@example.net', 'aa461a98ad2b400a711c1147826b232bbe2a605d', '8435345341'),
('Esther', 'Steuber', 'fatima39@example.com', '63c1955669a3b6252105d76e2b22c48a8bfe954a', '62435349333'),
('Liza', 'Cremin', 'hblanda@example.com', 'ffdd2bde9eb7ce77049b1fcd070bea8687355de8', '43534535'),
('Nelson', 'Kohler', 'leanne02@example.net', '34a3931c001f6d5d1b3335922ce2a574a63fd303', '934534522'),
('Korey', 'Wolff', 'swyman@example.com', '951265cb358071b6d101031ad69e73743c4f9beb', '74668345345341'),
('Jeramy', 'Runolfsson', 'emmerich.ellsworth@example.com', 'b87a73963bb755a9b2602ec82ee0bf197fcd266a', '13453453459'),
('Rowan', 'Walter', 'feeney.demario@example.com', 'b226dbaf9d2d8f63cac92861828d68c891e13101', '345345345'),
('Matilda', 'Prohaska', 'kiehn.pansy@example.org', '406b5e49e3a8114cad4e936dd6d30e487e29505d', '6534534534749'),
('Dominique', 'Padberg', 'colt.paucek@example.net', 'c8f9af2ad60c7cc91f97c85029ee4e072305f2ab', '978243'),
('Wendy', 'Green', 'isac.carter@example.net', '93eec641fe8186d5afcde52d24ce41dc949b0f57', '894467'),
('Forrest', 'Fisher', 'nmaggio@example.net', '15f50995de45686ed48b88a4439eb16991f54ff1', '345345345'),
('Sunny', 'Wisozk', 'karelle12@example.com', 'c2b1f0d656b9f4d24c84623d28abf352f77b91d6', '235345345345'),
('Ola', 'Cronin', 'wilburn55@example.net', '22eb57ac5255cfd8c8935328c3c59eb113693984', '1433453454'),
('Iva', 'Padberg', 'rose63@example.com', '0515f202cce9b4fd4064bc2610b011f18da190ec', '1992604988'),
('Kyra', 'Morissette', 'jerrod.bradtke@example.com', '899353c840194cb6e2f554028651f59bd9478c68', '467041'),
('Adele', 'Corwin', 'jackeline13@example.org', '8e9cf15cb1fb1a1c0ad75afd7b73cae8bdd5cd0c', '745543591'),
('Allen', 'Weimann', 'patsy11@example.org', 'a34a4e901eaa9f5e16c2fbe3f57c0582068c23f0', '23845435730'),
('Lionel', 'Kris', 'kiley19@example.net', 'cd982fdd65e71bb70aae609c8d705021473f22a4', '345345345'),
('Dallas', 'Graham', 'ywilderman@example.org', '01ee01c75424ab2cb042aba3819168becccb3396', '196678'),
('General', 'Gerlach', 'keon.fritsch@example.com', '4ca3a0e4c6fc5da833635b2aac50d7e13f09b9af', '5323903508'),
('Dax', 'O\'Conner', 'lois.oberbrunner@example.com', '07571bcb7765ba4e8a2fc5ad039a73b263222a16', '557'),
('Natalia', 'Thompson', 'salvador.hoeger@example.com', 'f1c353a7791813a806c96ae0697e0be65df62d5e', '853958'),
('Lorena', 'Miller', 'rosemary.pollich@example.net', '3addc3c7aac0f1181408e13289a9204c95e8ab81', '345345345'),
('Gregory', 'Wunsch', 'ernesto66@example.net', 'c343437b08fff61d6ec36b39302a4713f72277e3', '345345231234535'),
('Ross', 'Bernhard', 'dare.alexandrea@example.com', '0f270d1cbe82976e028afafc0e408151ddf2a41b', '643534534575'),
('Jammie', 'Haley', 'gleason.macy@example.org', '00ea4ac2ddf7625246d70118c05816fe99b3d204', '638434534534'),
('Vena', 'Dooley', 'o\'reilly.hilton@example.org', '82139f1c23ca2701e911020a2a44e2ebe3d55079', '933453450307'),
('Enoch', 'Flatley', 'price.jody@example.net', '9a0b9f7d1bd480091ed25f89dfbdd823dd3a0ffe', '117334534579'),
('Mary', 'Donnelly', 'beier.laurianne@example.com', '432b682b8021a48233aa7206dadf5931993b0cc7', '23453420336362'),
('Verlie', 'Shields', 'brittany04@example.com', '424e6dbed291b837663255e0cb198649e154e883', '43534534534'),
('Tyshawn', 'Bechtelar', 'eichmann.alia@example.com', '05cc0e9ce8704560c30b140bcfb3135439707bf7', '31435345154'),
('Curt', 'Dickinson', 'ygreenholt@example.com', 'ee053d256022b9d30eb8114294d34a799a592956', '486764'),
('Gregoria', 'Jones', 'borer.nicklaus@example.org', '6d3073f4b3f7b09056691bf3472c57ec9945f333', '641704851'),
('Jordi', 'Leannon', 'douglas.nicole@example.com', '268d0f59c591894a13fb2da6459eb6f1f02ca51f', '4'),
('Milan', 'Funk', 'jayde45@example.org', '5f0a23cee5f4b5937f49006e5b339609c9741a0e', '15'),
('Jayson', 'Little', 'xo\'connell@example.org', '923f2281abe9561d401fc250a54be0abcd25db37', '312699'),
('Russell', 'Kuhn', 'mcglynn.allison@example.com', 'ec0f1a2b6e8013f8187b0ac1adc23980df9ac6e8', '0'),
('Edison', 'Kutch', 'hettinger.monique@example.com', '223764b2c10c2d8d746ab53ede99e769bd48d01c', '78'),
('Dina', 'Schultz', 'o\'conner.green@example.com', '8af96cd33f94ec680e53f7cc46480891d42892f1', '0'),
('Emely', 'Bergstrom', 'feil.brice@example.com', '7831dc60ba5a390e609e6f34834721a4c3a12831', '0'),
('Elsa', 'Huels', 'gulgowski.adaline@example.com', '14226e4afe83df21393f4bab05702a3664268c29', '1'),
('Adan', 'Sawayn', 'spencer.lindgren@example.com', 'f2f20fa878e3ac312653d6edc0ed9628cf26d357', '70'),
('Josie', 'Hansen', 'tbeier@example.net', '31a33bc60613c53b437908fb9c1fa746fd64a76c', '380452'),
('Anita', 'Ruecker', 'savannah.koch@example.com', '9b24527630073e12922bf061acb891309178bcd6', '726416'),
('Jed', 'Abernathy', 'ilynch@example.com', 'caeba184f700bf8c96f16adca8cd93bd8d5afc06', '0'),
('Jonathan', 'Bosco', 'domenick.effertz@example.net', 'c1cbc7f57da22897897b712a4d41908278f46f89', '11'),
('Glennie', 'Kshlerin', 'beahan.nyasia@example.com', '5494d786a7a5021810677d80c94e2a3a85ba1397', '1'),
('Garland', 'Schuppe', 'harvey.yazmin@example.com', '7887732de1dd3c1862b2881219bd895fd4a4a410', '763892'),
('Guadalupe', 'Thiel', 'willms.kacey@example.org', '6e1cf3dfc5d8e0238ab2168b337179a4df710996', '145'),
('Pearline', 'Frami', 'cordell.douglas@example.net', 'aabd17d3d3efbcbf89d5e4ce871dfe7d2868910e', '782'),
('Hilton', 'Yost', 'lillian30@example.org', '8fea8c20ea9b049fcab76b98dd0697a960d03a1e', '465'),
('Ona', 'Deckow', 'kendrick08@example.com', '60042c35db07872e0463a1beec7a98630e00e323', '341648'),
('Rafael', 'Metz', 'ischulist@example.com', '31ec04a8692b6affe288d0d5bede9cb78dcee6a5', '189'),
('Jannie', 'Rodriguez', 'haylee69@example.org', '6f9f86ca7f7c58a8352c5ae1ca9285957ca146c3', '1'),
('Yessenia', 'Cassin', 'xd\'amore@example.net', '59f6e5ab95be2ae3c2e6d06f9b3bfdf2c4e2af28', '600'),
('Lela', 'Lockman', 'leon05@example.org', '60960b1cc20a7989c4ce517d81621d234e17cd69', '813'),
('Leo', 'Beahan', 'vcummings@example.org', 'd334e451b84ae6d0b844b47d3bbf164380009820', '796'),
('Arely', 'Rohan', 'kihn.evalyn@example.org', '3ce86d9786a0bc460a4808534cbbe80f200340a8', '6472768201'),
('Clemens', 'Heathcote', 'mcglynn.damaris@example.net', 'f9cf8100c47625db1b6f2b8e84fe5e28c4ef83e2', '432'),
('Angelo', 'Grant', 'walker.ricky@example.net', '85591e3ebf683cc30f8050cb732a6ec79dbb1ef7', '818655'),
('Clifton', 'Keebler', 'nkoss@example.net', '3bbb4ed50951c3e31a579f236f2e951df611ab38', '86'),
('Dariana', 'Mraz', 'aheidenreich@example.net', '6dffd937ab4a0044cd8d72d6e8528e044088e8b3', '324234'),
('Liliana', 'Carter', 'breanna18@example.com', '213551ed31e00fa08f83df4743f1540160f054d1', '2332432'),
('Alexandre', 'Crist', 'altenwerth.roxane@example.net', '2b8f3bafd5aec91c11961336b8d85434a34cd2cf', '2'),
('Ettie', 'Hodkiewicz', 'rgoodwin@example.com', '74ef6ea15e31803c36777a8ec6550785be400ba8', '23234234'),
('Helmer', 'Blanda', 'hanna35@example.org', '821799e4956c5084c0d348c7e842dbf5766e1f58', '1832342'),
('Davion', 'Effertz', 'langosh.ettie@example.com', '3230fba9157f5af2513c9aab5433568562b797ca', '1324');




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * Таблицы основных данных об оборудовании и проектах :
 * 
 * ПРИМЕЧАНИЕ: 
 * Данные сгенерированы самописным скриптом 
 * https://github.com/tedavydov/python2020/tree/DB_Fill/DB_Fill_Script
 * и подправлены вручную ..
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


-- таблица типов = каталог разновидностей оборудования

INSERT INTO eq_types (`partnumber`, `fullname`, `units`, `immanent`, `weight`, `power`) VALUES 
('BayStack45024T', 'Bay Stack 450 24T', '1', '24', '5', '200'),
('BayStack47048T', 'Bay Stack 470 48T', '1', '48', '5', '200'),
('BayStack4550T AL4500A02-E6', 'Bay Stack 4550T', '1', '50', '5', '200'),
('AVAYA VSP7224XLS24SFP', 'AVAYA VSP 7224 XLS 24SFP+', '1', '24', '5', '200'),
('Brocade SW VN10000762', 'Brocade SW 5140 HITACHI  HD-5140-1008.P  Коммутатор оптический Hitachi Brocade 5140 switch 40 active ports 40 SWL 8Gb/sec BR SFPs', '1', '40', '5', '200'),
('Brocade SW VN10000628', 'Brocade SilkWorm 5300 HITACHI HD-5340-0008.P Коммутатор оптический Brocade 5340 switch w/80 active ports 80 SWL', '2', '80', '5', '200'),
('Cisco WS-C3750G-48TS', 'Cisco CATALYST 3750G (WS C3750G) WS-C3750G-48TS', '1', '48', '5', '200'),
('Cisco C3750G-24TS-S', 'Cisco CATALYST 3750G (WS C3750G) C3750G-24TS-S', '2', '24', '5', '200'),
('DL360pG8', 'HP ProLiant DL360p Gen8', '1', '4', '20', '400'),
('DL360pG9', 'HP ProLiant DL360p Gen9', '1', '4', '20', '400'),
('DL360G10', 'HP ProLiant DL360 Gen10', '1', '4', '20', '400'),
('DL580G9', 'HP ProLiant DL580 Gen9', '4', '4', '44', '1200'),
('DL580G10', 'HP ProLiant DL580 Gen10', '4', '4', '44', '1200'),
('BL460СG7 603718-B21 VN07001151', 'HP ProLiant BL460С G7 СЕРВЕР X5670 3.0 GHZ 8 MB SFF SAS/SATA/SSD CTO BLADE SPECIAL BUNDLE', '0', '3', '7', '400'),
('BL460cG8', 'HP ProLiant BL460c Gen8', '0', '3', '11', '500'),
('BLSc7000 507015-B21 V100209019', 'HP BladeSystem c7000 507015-B21 V100209019', '10', '8', '204', '14700'),
('HP Eth-1/10 438031-B21 VN10000668', 'HP Коммутатор 1/10Gb Ethernet Blade Switch for c-Class BladeSystem  (4 порта 1Gb / 2 порта 10Gb)', '0', '4', '0', '0'),
('HP Eth-1 438030-B21 VN10000451', 'HP Коммутатор HP GbE2c Layer 2/3 Ethernet Blade Switch for c-Class BladeSystem 5 ports 100/1000 4 SFP slots', '0', '4', '0', '0'),
('HP SAN-8 AJ821A VN10000669', 'HP Коммутатор B-series 8Gb 24 port SAN для BladeSystem c-Class', '0', '8', '0', '0'),
('SF-T5220', 'Sun Fire T5220', '2', '3', '20', '400'),
('SF-E2900', 'Sun Fire E2900', '2', '3', '20', '400'),
('Cisco ASR1001-X', 'Cisco ASR1001-X', '1', '5', '5', '200'),
('Cisco ASR9901', 'CISCO ASR 9901', '2', '5', '25', '1100'),
('HBA Sun OLD SG-XPCIE1FC-EM4', 'HBA Sun 4GB 1P Fibre PCI-E(SG-XPCIE1FC-EM4)', '0', '1', '0', '0');



-- Перечень оборудования

INSERT INTO equipments (`serialnum`, `hostname`, `type_id`) VALUES 
('SSGNKB8096', 'hosttID3XWKyOj123358709j', '1'),
('ALM1159G75O', 'hostOZD5l12358400nE7k1_vx', '5'),
('FOC6674N65E', 'hostJQpfQH0x112352500Dy0NZ', '7'),
('CZJ283994P', 'hostKYtwFE12330730r9Pf3eO', '9'),
('6530NNA61D', 'hostMQb12392140QqTH5uis', '21'),
('CZJ82625JX', 'hostZGe_0h12311850t1lya6', '12'),
('AHX1136X580', 'hostbiCVx8Tje123275409vT', '6'),
('LBNNNNPQ375219', 'hostaepD-UjjC12302490ei8', '2'),
('MY33467M6R', 'hostAJ7JRyzqL12389990a1jy', '17'),
('CZJ601205V', 'hostUcMqoJiQAMR123024109GqFKQob', '10'),
('5543NNA83N', 'hostCTpz_cC12367740Ll8to0c', '21'),
('LBNNHWWW474398', 'hostACAvnZHbeYL12335080FlVaT_jQ1oD', '2'),
('SSGOLY1127', 'hostbkrpnvS112363490xaA4', '1'),
('FOC0223I86Q', 'hostAxuH2yzMY12350860yg1', '8'),
('CZJ828307L', 'hostjg5DO5KiYqF7123627602F', '9'),
('FOC8489UIKB', 'hostIM59Za12306110kF', '23'),
('SFXA8931M953', 'hosthesRfeY3jjKv12353400-D0', '22'),
('LBNNJXAI406568', 'hostPxYUP12322000s6X0', '2'),
('CZ9901H7FY', 'hostJwPJUTi12345410LkSrd3', '11'),
('FOC3831I25C', 'hostFbogD12353920crOgLDsM', '7'),
('CZJ78206HQ', 'hostuFdBZP6D12321700fNVKsRCk1BA', '12'),
('LBNNRFFL369823', 'hostBnq8nnAJ12302930H1', '2'),
('2536NNA61P', 'hostZQNUzKlv12357710CREhF5n', '21'),
('SFXM3619N003', 'hostzCpb12384560Rs9', '22'),
('CZJ562517S', 'hosttfR312351900xv6Q0vrpQ9', '9'),
('FOC4011MIQR', 'hostvC0012360430N_6B', '23'),
('ALM3986W95C', 'hostTbwjG7SNO7123748605f7ifptjYB', '5'),
('CZJ89459SQ', 'hostJtMkd12324890CkoA9s', '12'),
('BEL1101NZB', 'hostsyBoD142_12370160ozgGQUPMx', '20'),
('CZJ360815P', 'hostExo12390530uFAhH6MU', '9'),
('FOC0966E80Y', 'hostXBZC12311980BfhelG', '8'),
('FOC2461Y18M', 'hostodNy12366760cLHvJEVy1oH', '8'),
('SFXF6925N053', 'hostKW4IGZHwb1232044095zWPR', '22'),
('SFXL0282S491', 'hostrCuj12326420WyW21_Szy-t', '22'),
('ALM7568F75C', 'hostQr_isZb512360780ktTTEMy', '5'),
('CZ1556X2UR', 'hostPn8Fnp12317400B', '11'),
('LBNNCFCQ276OGG', 'hostno4NF6123393909iw4D', '3'),
('LBNNHCOB231782', 'hostINp2r123660405i87f8nH', '2'),
('13JP245V1270', 'hostVCOVPi11235690002AOssL5wqP', '4'),
('CZ9984ATJ0', 'hostbLZ8JX12311210cV_', '13'),
('CZ0853H7PX', 'hostok81P123628506GSIvD', '11'),
('AHX3351W456', 'hostKdMQhMS12307510BtQ', '6'),
('ALM7335L64K', 'hostxsEdI4vD123247804gc2', '5'),
('CZ3154RTI8', 'hostDLq2haPJ12317150P5f', '13'),
('SFXY8197B294', 'hostoplKBW12324910Tut', '22'),
('LBNNTPNR764UKA', 'hostpbuEEE_9123902702bbL', '3'),
('13JP106V9797', 'hostpGNdIh12303900ShwG0', '4'),
('13JP394V1184', 'hostQr9dq123838801-7', '4'),
('LBNNBRVV794FTB', 'hostDL6-l3H212317600hQe1YccCuq', '3'),
('LBNNMFMI293240', 'hostsQVCtXnWWP123043804o3yEqr', '2'),
('FOC6248GQXO', 'hostUDX9qa123678104', '23'),
('CZJ364976D', 'hostMFaTQ8Q12353710EJ5HAeKKNXW', '9'),
('BEL0745LRI', 'hostbvYr_FV12330660ytWNJ', '20'),
('SSGASN5120', 'hostqnO6ZTMs0812374370tSp89', '1'),
('SFXX2135O064', 'hostJYeXoZ123896501-FVty6aDy', '22'),
('LBNNVKWJ418DEZ', 'hostVXWO12361110ROHqP-sHaw', '3'),
('SFXS7090G678', 'hostILD12334150P', '22'),
('CZJ671585H', 'hostYFWVbI12325270CX99VJI', '9'),
('CZJ17835UQ', 'hostbXF712343260oXnrETUn6o', '12'),
('FOC9116BMGI', 'hosteFW12323130tL7VXgTy-', '23'),
('CZJ51298ZE', 'hosttxG12383070PACITV', '12'),
('CZJ696219I', 'hostNEgah0kd4f12332540SLNGME7', '10'),
('13JP775V2792', 'hostHdy7rUu4yYWxT12366060LPkRrijd7U', '4'),
('LBNNXUSB940427', 'hostAvVWGDdMa12312600YqwU7RawOF', '2'),
('CZ0258QDO0', 'hostCiv5ixF612301850Web0x_Jc', '13'),
('ALM3463K04E', 'hostuID123390708a8CEu2Lod9', '5'),
('CZJ770117B', 'hostFbUp123037705', '9'),
('CZJ537555X', 'hostRbh1TIMn12312680tltCUDcTlaO', '9'),
('FOC7455SSBF', 'hostJFwjf12377830y78Z1', '23'),
('4567NNA47W', 'hostHcHSwwuFz7vj212356250zQL5AbY8us', '21'),
('SSGZFM7374', 'hosteMSh7gbFfN0F12387610Sw95Bh', '1'),
('ALM7595B91R', 'hostOXrc6O12370430nXPiI4nzyI', '5'),
('CZ7641QZY5', 'hostPQvdXeuSQ91234807052u_OxxxsSZ', '13'),
('ALM4851L33R', 'hostpYTUZO-Lxu123267902WnscHBXC', '5'),
('CZ2874G42I', 'hostVCIYRGBDGUO8123269206qV7AFcST', '16'),
('CZ4517C66O', 'hostrxe12398230xu0JiBZGUS5', '16'),
('CZ8610H91N', 'hostsO4CQYG12337060DSZGNDBs', '16');



-- перечень модулей установленных в оборудовании

INSERT INTO modules (`serialnum`, `type_id`) VALUES 
('CZJ937190U','15'),
('CZJ069576B','15'),
('CZJ812720Y','15'),
('CZJ024592L','15'),
('CZJ243587Y','15'),
('CZJ6113RP2','14'),
('CZJ1141RS4','14'),
('CZJ7356RD9','14'),
('MY30424M6A','17'),
('MY30484M8L','17'),
('MY34405M0A','17'),
('MY33467M6R','17'),
('MY37575CZ1','18'),
('MY35551ON4','18'),
('MY39532UE0','18'),
('MY34542YE7','18'),
('MY37572HN8','18'),
('MY33554KB6','18'),
('CN8251Q54U','19'),
('CN8451Q85S','19'),
('CN8152A69M','19'),
('CN8356N25L','19'),
('CN8559F23I','19'),
('CN8554G12J','19'),
('0999BG0-07443718G1','24'),
('0999BG1-07449934S0','24'),
('0999BG2-07449457F7','24');



-- список проектов

INSERT INTO projects (`user_id`, `projnum`, `fullname`) VALUES 
('33','TASK6641','East Garrychester'),
('43','RFC17777','Port Wanda'),
('64','TASK0087','Virgiefort'),
('55','RFC17115','Lake Earnesthaven'),
('10','RFC17415','Cotyport'),
('18','TASK1816','Wymanhaven'),
('95','TASK1888','Konopelskiland'),
('73','TASK8558','Schinnerfurt'),
('77','RFC18567','West Maudton'),
('2','TASK8678','West Jonathan'),
('9','TASK6786','South Lilla'),
('36','TASK0787','West Arishire'),
('82','BEE29767','Shanahanfurt'),
('67','RFC17473','VonRuedenland'),
('83','TASK1879','South Jaydentown'),
('32','TASK1556','Schimmelstad'),
('11','TASK1555','New Ines'),
('5','RFC17755','South Colton'),
('23','TASK5677','Ahmedtown'),
('40','TASK3676','Lake Chrisfort'),
('7','TASK1789','Lake Vince'),
('48','BEE23457','Port Vilmaville'),
('72','RFC18546','West Jett'),
('69','RFC18325','East Dixieview'),
('30','RFC13458','Zeldaton'),
('29','RFC15437','Collinsfurt'),
('14','RFC15667','Littlemouth'),
('72','RFC17176','Port Leannaborough'),
('28','RFC17454','South Nelleside'),
('33','TASK1866','Nicklaushaven'),
('4','TASK1867','Altenwerthstad'),
('93','RFC18677','Lemkeview'),
('79','RFC14566','Luettgenville'),
('35','RFC12345','Lefflerport'),
('24','RFC13455','South Mathias'),
('13','RFC14534','Jocelynfort'),
('87','RFC12222','South Pablofurt'),
('96','RFC13477','West Alexandrebury');



-- таблица связей проектов с оборудованием

INSERT INTO proj_links (`proj_id`, `equipment_id`) VALUES 
('32', '58'),
('19', '73'),
('23', '62'),
('30', '30'),
('11', '31'),
('37', '20'),
('24', '3'),
('24', '46'),
('35', '63'),
('15', '27'),
('14', '12'),
('19', '29'),
('20', '22'),
('17', '75'),
('21', '66'),
('37', '73'),
('25', '9'),
('20', '40'),
('32', '15'),
('10', '68'),
('36', '21'),
('24', '30'),
('25', '69'),
('3', '65'),
('34', '59'),
('21', '44'),
('6', '13'),
('32', '46'),
('13', '30'),
('18', '64'),
('17', '77'),
('8', '74'),
('15', '47'),
('36', '51'),
('5', '60'),
('7', '76'),
('38', '58'),
('31', '8'),
('1', '23'),
('16', '39'),
('20', '27'),
('26', '15'),
('28', '31'),
('27', '64'),
('15', '31'),
('17', '68'),
('15', '11'),
('26', '46'),
('27', '1'),
('37', '3'),
('28', '63'),
('31', '4'),
('30', '42'),
('15', '65'),
('23', '39'),
('1', '44'),
('6', '68'),
('8', '4'),
('17', '22'),
('23', '54'),
('30', '17'),
('17', '2'),
('5', '56'),
('27', '73'),
('38', '36'),
('5', '51'),
('28', '15'),
('23', '72'),
('11', '9'),
('23', '60'),
('11', '56'),
('22', '1'),
('1', '9'),
('10', '75'),
('38', '30'),
('37', '50'),
('3', '37'),
('22', '38'),
('37', '41'),
('9', '68'),
('33', '8'),
('24', '19'),
('31', '48'),
('25', '4'),
('25', '6'),
('16', '38'),
('38', '51'),
('17', '20'),
('15', '2'),
('7', '22'),
('38', '12'),
('1', '33'),
('24', '47'),
('17', '47'),
('13', '31'),
('12', '69'),
('4', '51'),
('25', '57'),
('16', '2'),
('30', '24');



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * Таблицы данных о коммутации оборудования :   
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- перечень используемых слотов в оборудовании

INSERT INTO slots (`slot_name`, `eq_id`, `mod_id`) VALUES 
('OA1','75',NULL),
('OA2','75',NULL),
('Bay 1','75','1'),
('Bay 2','75','3'),
('Bay 3','75','8'),
('Bay 4','75','15'),
('Stack 1','13',NULL),
('Bay 5','75','16'),
('Stack 1','1',NULL),
('Bay 3','77','7'),
('Bay 4','77','10'),
('Stack 3','64',NULL),
('Stack 2','1',NULL),
('Bay 2','77','5'),
('Stack 1','46',NULL),
('PCI 1','62',NULL),
('PCI 1','58',NULL),
('PCI 1','36',NULL),
('Bay 3','76','2'),
('Stack 1','56',NULL),
('Bay 7','77','14'),
('PCI 1','19',NULL),
('Bay 5','76','9'),
('Bay 4','76','6'),
('Stack 1','49',NULL),
('Bay 6','76','11'),
('Bay 8','76','23'),
('OA1','77',NULL),
('PCI 2','25',NULL),
('PCI 1','15',NULL),
('Bay 7','76','13'),
('PCI 2','62',NULL),
('PCI 2','67',NULL),
('Stack 1','64',NULL),
('Bay 5','77','12'),
('Stack 2','64',NULL),
('Bay 6','77','18'),
('Bay 6','75','22'),
('Bay 7','75','19'),
('Bay 8','75','24'),
('OA2','77',NULL),
('Bay 1','77','4'),
('Bay 8','77','17');



-- перечень портов оборудования

INSERT INTO ports (`port_name`, `slot_id`, `port_num`) VALUES 
('Mng','1','1'),
('Mng','1','2'),
('Mng','2','1'),
('Mng','2','2'),
('Eth','3','1'),
('Eth','3','2'),
('Eth','4','1'),
('Eth','4','2'),
('Eth','5','1'),
('Eth','5','2'),
('Eth','6','1'),
('Eth','6','2'),
('Eth','7','1'),
('Eth','7','2'),
('Eth','8','1'),
('Eth','8','2'),
('Eth','9','1'),
('Eth','9','2'),
('Eth','10','1'),
('Eth','10','2'),
('Eth','11','1'),
('Eth','11','2'),
('Eth','12','1'),
('Eth','12','2'),
('Eth','13','1'),
('Eth','13','2'),
('Eth','14','1'),
('Eth','14','2'),
('Eth','15','1'),
('Eth','15','2'),
('Eth','16','1'),
('Eth','16','2'),
('Eth','17','1'),
('Eth','17','2'),
('Eth','18','1'),
('Eth','18','2'),
('Eth','19','1'),
('Eth','19','2'),
('Eth','20','1'),
('Eth','20','2'),
('Eth','21','1'),
('Eth','21','2'),
('Eth','22','1'),
('Eth','22','2'),
('Eth','23','1'),
('Eth','23','2'),
('Eth','24','1'),
('Eth','24','2'),
('Eth','25','1'),
('Eth','25','2'),
('Eth','26','1'),
('Eth','26','2'),
('Eth','27','1'),
('Eth','27','2'),
('Mng','28','1'),
('Mng','28','2'),
('Eth','29','1'),
('Eth','29','2'),
('Eth','30','1'),
('Eth','30','2'),
('Eth','31','1'),
('Eth','31','2'),
('Eth','32','1'),
('Eth','32','2'),
('Eth','33','1'),
('Eth','33','2'),
('Eth','34','1'),
('Eth','34','2'),
('Eth','35','1'),
('Eth','35','2'),
('Eth','36','1'),
('Eth','36','2'),
('Eth','37','1'),
('Eth','37','2'),
('Eth','38','1'),
('Eth','38','2'),
('Eth','39','1'),
('Eth','39','2'),
('Eth','40','1'),
('Eth','40','2'),
('Mng','41','1'),
('Mng','41','2'),
('Eth','42','1'),
('Eth','42','2'),
('Eth','43','1'),
('Eth','43','2');




-- таблица коммутаций

INSERT INTO port_links (`port1_id`, `port2_id`) VALUES 
('48', '69'),
('9', '22'),
('58', '43'),
('47', '68'),
('49', '80'),
('69', '52'),
('84', '50'),
('6', '77'),
('4', '73'),
('39', '65'),
('16', '57'),
('85', '82'),
('67', '17'),
('84', '83'),
('64', '39'),
('79', '11'),
('8', '29'),
('53', '40'),
('27', '38'),
('2', '40'),
('71', '23'),
('44', '47'),
('7', '18'),
('82', '3'),
('63', '59'),
('76', '5'),
('75', '24'),
('74', '65'),
('28', '39'),
('67', '44'),
('61', '15'),
('20', '37'),
('14', '84'),
('41', '51'),
('48', '10'),
('25', '45'),
('36', '55'),
('32', '81'),
('66', '30'),
('26', '70'),
('13', '1'),
('78', '31'),
('46', '21'),
('62', '12'),
('19', '33'),
('54', '65');


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 * Дополнительные информационные таблицы  
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

-- таблица комментариев

INSERT INTO comments (`comment_text`) VALUES 
('noted mechanical damage, not reflected at work'),
('reserve for expansion'),
('found in a warehouse in a backup data center'),
('check under heavy load'),
('verify'),
('warning'),
('for BigDATA ???'),
('what is it'),
('admin: this is a defective module'),
('reserved'),
('not found in rack'),
('fix commutation'),
('check markings'),
('check rack consumption'),
('mount organizer'),
('check commutation'),
('wrong markings'),
('incorrect installation'),
('wrong commutation'),
('pending verification'),
('Stress Testing'),
('prepared for sending to the region'),
('for dismantling'),
('for filling'),
('for platform expansion'),
('delivered from vendor'),
('shortage'),
('will be picked up next week'),
('luptas aspernatur itaque.omodi ex maxim'),
('delivered from the region'),
('Magnam aspernatur ullamtfacilis moles'),
('for new projects'),
('Quo itaque volupte deserunt ut.'),
('delivered for testing'),
('promised to return'),
('pouring in progress'),
('returned yesterday'),
('Dicta nobis earui aut repellen'),
('Ut conseqtr voluptas et'),
('under tests'),
('will be picked up in a month'),
('Voluptatibus quibua est quaerat'),
('incomplete complete set'),
('Fugit accusamus'),
('yes it is a Quisqua'),
('Architecto aut ipsum ut dolore'),
('Escaped from ..'),
('Et tatem unde corrupti non blanditiis'),
('ue eos'),
('Illum non omnis'),
('Perferendis facere in et omni'),
('Cum rerum ipsa'),
('delectus assumenda magnam ut labo'),
('Consequatur expedita eaqu'),
('come to life'),
('store: the module is prepared for sending to the vendor'),
('consequatur et'),
('volup'),
('Architecto aut ipsum'),
('Fugdgdeseru'),
('corrupti non bland'),
('nditiis   rem'),
('incidunt fugiat'),
('Perferendis facere   endis'),
('omnis quasi quam'),
('launch an incident'),
('Consequatur exp'),
('Eveniet vitae'),
('icabo nisi id . Quo itaque'),
('que doloremque odio sit veritatis ipsam'),
('Reiciendis'),
('Reiciend'),
('Sit dolorem eligendi ipsum'),
('voluptatem adipisci distinctio'),
('i placeat ut rerum'),
('tempora sequi numquam harum'),
('and all that he made them'),
('Qui ipsam in culpa'),
('ue eos'),
('Ut cumque non accusamus'),
('Rerum reicien'),
('Debitis magna'),
('Reasonable consumer discs discard');





-- таблица связей комментариев с записями

INSERT INTO comment_links (`table_name`,`tab_row_id`, `comment_id`) VALUES 
('ports', '48', '42'),
('ports', '84', '38'),
('ports', '23', '75'),
('ports', '67', '58'),
('ports', '42', '10'),
('ports', '17', '54'),
('ports', '31', '16'),
('ports', '50', '6'),
('ports', '83', '81'),
('ports', '58', '3'),
('ports', '81', '61'),
('ports', '45', '78'),
('ports', '22', '37'),
('ports', '31', '66'),
('ports', '73', '45'),
('ports', '81', '28'),
('ports', '85', '60'),
('ports', '3', '34'),
('ports', '57', '12'),
('ports', '50', '65'),
('ports', '11', '81'),
('ports', '56', '38'),
('ports', '83', '75'),
('ports', '29', '32'),
('ports', '9', '21'),
('ports', '60', '21'),
('ports', '71', '31'),
('ports', '61', '82'),
('ports', '68', '73'),
('ports', '81', '43'),
('ports', '13', '25'),
('ports', '51', '74'),
('ports', '86', '13'),
('ports', '24', '22'),
('ports', '11', '77'),
('ports', '73', '57'),
('ports', '46', '66'),
('ports', '4', '56'),
('ports', '27', '23'),
('ports', '75', '7'),
('ports', '66', '83'),
('ports', '2', '71'),
('ports', '2', '82'),
('ports', '37', '6'),
('ports', '17', '34'),
('ports', '13', '70'),
('ports', '2', '29'),
('ports', '53', '76'),
('ports', '60', '65'),
('ports', '45', '61'),
('ports', '20', '39'),
('ports', '60', '19'),
('ports', '75', '20'),
('ports', '7', '29'),
('ports', '74', '12'),
('ports', '26', '33'),
('ports', '67', '1'),
('ports', '3', '42'),
('ports', '45', '9'),
('ports', '12', '69'),
('ports', '36', '30'),
('ports', '1', '56'),
('ports', '56', '25'),
('ports', '12', '62'),
('ports', '45', '13'),
('ports', '30', '59'),
('ports', '36', '55'),
('ports', '16', '6'),
('ports', '28', '76'),
('ports', '55', '34'),
('ports', '79', '14'),
('ports', '75', '25'),
('ports', '70', '69'),
('ports', '19', '61'),
('ports', '25', '21'),
('ports', '86', '22'),
('ports', '20', '2'),
('ports', '3', '44'),
('ports', '25', '2'),
('ports', '46', '30'),
('slots', '25', '8'),
('slots', '7', '7'),
('slots', '1', '51'),
('slots', '43', '35'),
('slots', '31', '73'),
('slots', '5', '4'),
('slots', '2', '36'),
('slots', '20', '37'),
('slots', '38', '42'),
('slots', '5', '11'),
('slots', '26', '38'),
('slots', '26', '22'),
('slots', '31', '55'),
('slots', '34', '29'),
('slots', '25', '19'),
('slots', '21', '5'),
('slots', '26', '16'),
('slots', '41', '74'),
('slots', '33', '58'),
('slots', '20', '18'),
('slots', '38', '29'),
('slots', '21', '36'),
('slots', '15', '25'),
('slots', '22', '77'),
('slots', '41', '47'),
('slots', '12', '74'),
('slots', '38', '71'),
('slots', '27', '81'),
('slots', '43', '47'),
('slots', '35', '74'),
('projects', '13', '52'),
('projects', '6', '59'),
('projects', '32', '29'),
('projects', '6', '6'),
('projects', '25', '64'),
('projects', '15', '20'),
('projects', '6', '50'),
('projects', '23', '24'),
('projects', '8', '47'),
('projects', '15', '63'),
('projects', '13', '48'),
('projects', '16', '11'),
('projects', '22', '43'),
('projects', '33', '17'),
('projects', '14', '33'),
('projects', '11', '36'),
('projects', '26', '53'),
('projects', '34', '32'),
('projects', '30', '75'),
('projects', '4', '81'),
('projects', '8', '10'),
('projects', '22', '7'),
('projects', '16', '15'),
('projects', '3', '50'),
('projects', '22', '56'),
('projects', '24', '27'),
('projects', '21', '24'),
('projects', '10', '70'),
('projects', '29', '33'),
('projects', '3', '51'),
('modules', '23', '7'),
('modules', '7', '72'),
('modules', '20', '60'),
('modules', '19', '12'),
('modules', '22', '22'),
('modules', '10', '36'),
('modules', '12', '38'),
('modules', '18', '13'),
('modules', '15', '56'),
('modules', '18', '4'),
('modules', '14', '2'),
('modules', '15', '9'),
('modules', '11', '50'),
('modules', '19', '53'),
('modules', '18', '27'),
('equipments', '64', '40'),
('equipments', '23', '81'),
('equipments', '27', '41'),
('equipments', '36', '47'),
('equipments', '34', '10'),
('equipments', '74', '8'),
('equipments', '41', '79'),
('equipments', '19', '46'),
('equipments', '70', '21'),
('equipments', '14', '45'),
('equipments', '61', '69'),
('equipments', '53', '11'),
('equipments', '13', '80'),
('equipments', '10', '80'),
('equipments', '69', '61'),
('equipments', '56', '27'),
('equipments', '60', '47'),
('equipments', '10', '78'),
('equipments', '56', '15'),
('equipments', '31', '30'),
('equipments', '7', '48'),
('equipments', '21', '43'),
('equipments', '77', '56'),
('equipments', '76', '65'),
('equipments', '11', '66'),
('eq_types', '21', '36'),
('eq_types', '16', '29'),
('eq_types', '18', '10'),
('eq_types', '5', '45'),
('eq_types', '19', '79'),
('eq_types', '4', '80'),
('eq_types', '24', '37'),
('eq_types', '8', '1'),
('eq_types', '6', '80'),
('eq_types', '5', '54');




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   
 *
 * 
 * 
 *  
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */




