# Keyboards : et toi comment tu tapes ?

Aujourd'hui on va parler d’un outil que vous utilisez tous les jours, qui est devenu incontournable dans nos sociétés numériques mais très sous-estimé : le clavier.

## Qu'est-ce qu'un clavier ?

Commençons par un rappel historique et technique.
Le clavier est une interface humain-machine qui permet la saisie de texte avec une ou plusieurs touches correspondant à des lettres, symboles ou actions.

-   Les premiers claviers sont apparus comme moyen de faciliter l'écriture, ce sont les premières machines à écrire au 18eme et 19eme siècles. (premier brevet 1714 Henry Mill - Angleterre)

-   Lorsque les premiers ordinateurs arrivent, la saisie de texte devient très vite un des usages principaux pour interagir avec les systèmes d'exploitation alors en ligne de commande (vers 1960). On réemploie alors le principe existant du clavier des machines à écrire.

-   Fin des années 70 les fabricants commencent à décliner les claviers en fonction des langues des zones géographiques.

-   Dans les années 80 le Personal Computer commence à envahir les bureaux et les habitations.

Mais alors comment ça marche un clavier ?
En principe c'est très simple, on presse une ou plusieurs touches et le clavier envoie un signal à l'ordinateur pour lui dire ce qu'il doit faire.

Simple n'est-ce pas ? A un détail près, un clavier classique c'est 105 touches pour la norme [ISO/IEC 9995-2](https://en.wikipedia.org/wiki/ISO/IEC_9995) (initié par l'AFNOR en 1984) ou 104 pour la norme ANSI-INCITS 154-1988 utilisée principalement aux Etats-Unis et surtout un interrupteur par touche.

![iso-vs-ansi](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/01-ANSI-vs-ISO-Keyboard.jpg)

Pour ne pas avoir 105 fils dans un câble reliant l'ordinateur au clavier ceux-ci sont conçu sous forme de matrice représentant les lignes et les colonnes.

![schema-matrice](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/02-sw_matrix.png)

Et pour ceux qui se souviennent de leurs cours d'électronique vous aurez remarqué le principal problème de cette matrice, le courant peut remonter d'une ligne à une autre si deux touches sont pressées en même temps. La solution étant simplement d'ajouter des diodes bloquant le sens du courant dans une seul direction, ligne vers colonne ou colonne vers lignes. On parle alors de matrice de diodes.

![schema-matrice-diode](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/03-diode_matrix.png)

Les claviers intègrent un microcontrôleur qui va alors "scanner" la matrice. En alimentant une colonne (sortie) on peut savoir quelle touche est pressée sur la ligne correspondante (entrée). En scannant la matrice plusieurs fois par seconde il devient très facile de suivre les touches pressées par l'utilisateur.

![scan-matrice](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/04-scan-matrix.gif)

L'avantage d'une matrice se retrouve aussi dans l'optimisation des entrées/sorties du microcontrôleur. Prenons les cas d'un clavier de 84 touches, celui-ci peut être représenté sous la forme d'une matrice 14x6 ou de 12x7. Dans le premier cas nous avons alors 14 colonnes et 6 lignes soient 20 entrées/sorties à gérer, pour la seconde matrice nous avons 12 colonnes et 7 lignes soit 19 entrées/sorties. Il devient alors intéressant de pouvoir libérer une entrée/sortie pour ajouter une fonctionnalité comme un rétroéclairage RGB. Les [LED RGB SK6812MINI-E](http://www.normandled.com/Product/view/id/875.html) par exemple sont montées en série ce qui permet de n'utiliser qu'un seul port I/O avec un bus de données sur 24bit.

Les interrupteurs eux existent principalement sous plusieurs formes :

-   un "dôme" de caoutchouc avec une pastille conductrice vient fermer un circuit sous la pression.
-   les interrupteurs mécaniques où une pièce de plastique vient déplacer un contacteur en métal.
-   les interrupteurs optiques, plus rares, ou la pièce mécanique en plastique vient ici bloquer un signal lumineux. Ces interrupteurs sont caractérisés par un temps de réponse plus faible.

La différence entre ces solutions se fera sur le confort de frappe (la force nécessaire, la sensation linéaire ou pas, le son avec les interrupteurs 'clicky' et leur bruit reconnaissable dans les open spaces).
Le principe lui restera le même, lorsque l'on appuie sur la touche un mouvement vertical vers le bas va actionner un contact qui envoie un signal.

![gif-switches](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/05-switches.gif)

Et justement il reste un point de fonctionnement à expliquer : comment l'information des touches pressées est transmise du clavier vers l'hôte.

Là rien de bien compliqué non plus, les interfaces humain-machine (ou _Human Interface Devices_ HID sous classe des _Physical Interface Devices_ PID) sont des types de périphériques faisant partie intégrante de la spécification USB.

L'hôte initie la conversation avec le périphérique qui en retour lui transmet des données. Dans le cas des HID, ces données suivent un codage bien précis définit dans les HID Usage Tables que l'on peut retrouver sur le site de l'[USB Implementers Forum](https://www.usb.org/hid)

Pour les plus curieux, le youtubeur Ben Eater a fait une très bonne vidéo expliquant plus en détail le [protocole USB pour les claviers](https://www.youtube.com/watch?v=wdgULBpRoXk) avec en bonus un rappel sur le protocole pour les claviers PS/2 (attention ça peut être assez technique).

## Se réapproprier nos outils de production...

Je suis en vieux joueur de World of Warcraft (17 ans) et depuis plusieurs années j'utilise en pad pour ne pas avoir mal au poignet et mieux gérer mes raccourcis.

Fin 2019 j'ai commencé à me demander si je ne pourrais aussi améliorer l'utilisation du clavier au quotidien et plus particulièrement pour coder.

Peu de temps après un certain virus a libéré beaucoup de temps dans mon agenda et j'ai commencé à creuser le sujet sans savoir jusqu'où cela allait m'emmener.

### level 1 : faire ses courses

Le point de départ sera toujours de savoir ce que l'on cherche à améliorer :

-   avoir plus facilement accès à des caractères spéciaux
-   optimiser l'espace en supprimant des touches inutiles ou au contraire ajouter des touches paramétrables
-   rendre la frappe plus confortable
-   réduire des douleurs avec une position plus ergonomique

Pour la saisie de code je me suis vite rendu compte que l'AZERTY n'est pas le mieux adapté, les caractères spéciaux demandent plus de combinaison de touches, certaines demandant parfois une certaine flexibilité des doigts.
D'un autre coté le QWERTY n'est pas fait pour utiliser des accents mais c'est la disposition de touche la plus courante donc celle que presque tous les claviers du marché utilisent par défaut.

![AZERTY](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/06-Azerty.png)

![QWERTY](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/07-Qwerty.png)

L'une des premières choses que j'ai constatées c'est que le marché grand public des claviers s'ouvre de plus en plus à des modèles non standard.

De plus, plusieurs grandes marques comme Razer, propose désormais des claviers avec des touches différentes, à membrane ou mécanique, plus ou moins dures. Mais récemment sont apparu des claviers grand public de format plus petits tel le TKL (Ten Key Less), un clavier classique auquel on a retiré le pavé numérique.

![razer-size](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/08-razer-size.jpg)

Enfin quand on aime son clavier et qu'on l'utilise tous les jours on peut aussi vouloir changer la couleur ou la forme des touches.

Les rendre plus transparentes pour laisser passer la lumière ou changer de matière pour un toucher différent. Par exemple les deux principales matières, l'ABS (Acrylonitrile Butadiene Styrene) ou le PBT (Poly Butylène Téréphtalate) ont des coûts, une durabilité et des choix de teintes différents.

![boba-fett](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/09-boba-fett.jpeg)

Bref rien qu'en ouvrant son portefeuille on a accès à un très grand nombre d'options qui couvriront la plupart de vos besoins mais... et si on passait au niveau suivant ?

### level 2 : software

Vous avez réussi à trouver le clavier au bon format, avec les bons switches et les touches qui vous plaisent.

Mais parfois un layout classique n'est pas suffisant pour obtenir une disposition de touche adaptée à nos besoins.

Avec le temps, de nombreuses personnes se sont penchées sur la question et en plus des dispositions de touches propres à chaque pays, plusieurs idées ont été explorées.

Soit des évolutions de formats existants :

-   nouvelle version de l'Azerty mise au point par l'AFNOR, également appelée Azerty+, qui est disponible à la fois en clavier physique (commercialisé par LDLC par le passé) ou sous forme de drivers
-   le Qwerty international qui reprend la disposition de touche du Qwerty mais rend certaines touches mortes (' " `) afin de les utiliser en combinaisons des autres touches pour former les caractères accentués.

![azerty+](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/10-Azerty_AFNOR.png)

![qwerty-intl](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/11-Qwerty_intl.png)

Soit avec des dispositions non conventionnelles :

-   le Dvorak, mis au point dans les années 30 pour la saisie de l'anglais puis décliné dans des variantes locales
-   le Bépo, sorti en 2003 pour améliorer la saisie du français et des langages de programmation.

![dvorak](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/12-Dvorak.png)

![bépo](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/13-Bépo.png)

Quel que soit celle qui vous convient le mieux, changer de disposition de touches est extrêmement simple (qui n'a jamais fait cette blague de passer le clavier d'un collègue en cyrillique...) et surtout cela ne vous coutera rien.

Mais le monde des claviers mécanique est ainsi fait et la recherche de la solution parfaite est sans fin.

### level 3 : hardware

![image-price](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/14-price.png)

Lorsque l'on a fait le tour des clavier présents dans le commerce force est de constater que la forme change peu, un rectangle d'une centaine de touches alignées par lignes.
Comparer à la forme d'une main on peut légitimement se demander si on ne peut pas faire mieux.

![hand-ergo](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/15-hand.jpg)

L'utilisation régulière d'un clavier peut provoquer des douleurs et même de l'arthrose (une dégradation du cartilage articulaire) au niveau des doigts et poignets.
Nos doigts sont aussi faits pour se plier sur un seul axe longitudinal et leur mobilité latérale est assez réduite. Vous pouvez faire le test sur votre clavier, pour atteindre certaines touches toute votre main va se déplacer et pas seulement votre doigt.

Et c'est justement la question que des milliers de makers se pose.
Est alors apparu le mouvement des Custom Mecanical Keyboards, le but est simple : repenser la forme et les usages des claviers.

![macropad](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/16-macropad.jpg) ![numpad](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/17-numpad.png)

Evidemment quand on décide de fabriquer son propre clavier le choix des composants se pose rapidement et ça peut être un problème.
En premier les switches qui, en fonction de vos préférences (taille de switch, mécanisme, force des ressorts, lubrification, amortisseur de frappe), peuvent donner le vertige avec plusieurs dizaines de références différentes.

![switch-tester](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/18-switches.jpg)

Ensuite les différents profils de touches qui impactent la sensation de frappe et, en fonction de la matière utilisée, le son.
On peut vouloir des touches plus hautes ou légèrement courber pour plus de confort si le clavier est incliné ou utilisé avec un repose poignet.

![keycaps-profile](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/19-profile.jpg)

Enfin les microcontrôleurs, comme l'Arduino Pro Micro (architecture ARM basé sur ATmega32U4) dont le faible prix a fait de lui le composant de base pour un grand nombre de claviers, il est aussi facilement programmable en C++.
S'en est suivi une longue série de microcontrôleurs avec chacun sa spécificité :

-   les feathers souvent basé sur un processeur ATmega et embarquant nativement le support du Bluetooth
-   le Proton-C de QMK embarquant une processeur ARM Cortex
-   le dernier en date le Raspberry Pi Pico, lui aussi en ARM Cortex mais surtout avec un prix extrêmement faible (environ 5€) et supportant le Python.

Mais ces micro contrôleurs ont un nombre d'entrées/sorties limité ce qui contraint la taille des claviers et le nombre maximal des touches adressable sur une matrice de diodes (pour un Arduino Pro Micro à 18 I/O le maximum étant de 9×9=81).

Apparaissent alors de nouveaux formats, car oui pour les claviers la taille ça compte et c'est même un des principaux critères.
Vous pouvez par exemple suivre ce diagramme pour déterminer la taille qui vous convient.

![keyboard_chart](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/20-keyboard_chart.png)

Bon ok, c'est un peu dense alors on va se limiter aux formats les plus populaires :

-   le classique 100%, ou full size, pas besoin de le présenter.
-   le 80%, ou TKL pour Ten Key Less, dont on a déjà parlé est un clavier classique sans pavé numérique.
-   le 75% est assez proche du 80% mais certaines touches comme Insert ou Impression écran sont supprimée car peu utilisées au quotidien.
-   le 60%, qui est certainement le plus populaire, va lui retirer les touches directionnelles et les touches de fonctions.
-   le 40% enfin, adopte un format ultra compact en supprimant les touches numériques.

![size-compare](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/21-size-chart.png)

Quelques exemples de claviers mécaniques custom :

![75%](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/22-75.jpg)

![60%](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/23-60.jpg)

![40%](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/24-40.jpg)

Mais alors comment garder un clavier fonctionnel avec si peu de touches ? La magie vient du firmware qui va piloter le microcontrôleur, comme [QMK](https://qmk.fm/) un firmware Open Source en C++ (oui les mêmes qui sont derrière le microcontrôleur Proton-C).

Le firmware va nous permettre de rendre paramétrable chaque touche du clavier, ajouter des couches permettant d'accéder à toutes les caractères de la disposition choisi dans le système d'exploitation, mais aussi d'offrir de nouvelles fonctions.
Par exemple, pourquoi ne pas avoir une combinaison de touches saisissant automatiquement votre email ou lançant la compilation de notre code ? Ou encore, rester appuyé 1 seconde sur la touche C pour faire un copier ? Ou même afficher sur l'écran du clavier des statistiques sur votre vitesse de frappe.

![screenshot-QMK](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/25-QMK.png)

La liberté est totale.

Une autre particularité des microcontrôleurs est de pouvoir communiquer, avec le protocole I2C par exemple.
Pourquoi ne pas ajouter un écran ? un buzzer ? un trackball ? un retour haptique ?
L'ensemble des composants électroniques de la scène maker est accessible pour n'importe quel projet.

![speaker](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/26-speaker.png) ![oled](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/27-oled.png) ![trackball](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/28-trackball.png) ![haptic](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/29-haptic.png)

Un microcontrôleur peut aussi communiquer avec un autre microcontrôleur et il devient possible de combiner deux claviers pour obtenir un "split" keyboard.
C'est le premier pas dans le vaste univers des "ergo" où la priorité devient le confort avec la recherche de la meilleure position des mains et des doigts.

![split](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/30-split.jpg)

Puis on abandonne les touches alignées par lignes pour les replacer en colonne dans l'axe des doigts et on offre au pouce un peu plus de possibilités

[ergodash](https://github.com/omkbd/ErgoDash)

![ergodash](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/31-ergodash.jpg)

Encore une fois un choix infini est à notre portée, sous forme de claviers prémonté comme les Ducky ou Ergodox mais aussi sous forme de kits à assembler soi-même comme chez Keebio.

![ducky](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/32-ducky.jpg)

![ergodox](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/33-ergodox.jpg)

![sinc-kit](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/34-sinc-kit.jpg)

L'Open Source a fortement poussé l'émergence de l'Open Hardware qui rend accessible les fichiers de conception de circuits imprimés ou du boitier pour les modifier ou les faire fabriquer s'ils ne sont pas disponibles.

Enfin, tant qu'à modifier un clavier existant pourquoi ne pas passer au niveau suivant ?

### level 4 : from scratch (not this one)

Au final ce n'est pas si compliqué que ça, il est alors possible de concevoir son propre clavier :

Le handwiring : cette approche assez minimaliste ne se préoccupe que de la position des switches.
On vient alors fabriquer seulement le support des switches, pas de circuit imprimé, tout est câblé à la main.
Simple et rapide pour faire du prototypage mais aussi efficace pour débuter ou limiter les coûts de fabrication.

![handwire](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/35-handwire.jpg)

S’il vous reste des notions d'électronique du collège, fabriquer votre propre circuit ne sera pas bien dur non plus. Internet regorge de tutoriels sur la prise en main de [Kicad](https://www.kicad.org/) (logiciel Open Source pour la conception du circuit imprimé), l'utilisation d'un microcontrôleur type Arduino nous évitant les soudures les plus délicates.

![kicad](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/36-kicad.png)

Avec un peu de dextérité vous pourrez aussi vous passer de microcontrôleur externe et souder le processeur au circuit directement. C'est une approche plus délicate mais qui permet de faire des claviers plus fins et avec plus de fonctionnalités car la plupart des microcontrôleurs n'exploite pas toutes les entrée/sorties du processeur embarqué.
C'est par exemple le cas avec un Arduino Pro Micro qui dispose de 18 entrées/sorties alors que le processeur [ATmega32U4](https://www.microchip.com/en-us/product/ATmega32U4) qu'il embarque propose 26 entrées/sorties programmables dont deux généralement réservées pour le bus USB.

Pour le boitier il sera très simple de faire un sandwich, un clavier fait avec trois couches de circuit imprimé, mais il sera tout aussi simple de lancer [Fusion360](https://www.autodesk.fr/products/fusion-360/overview) pour concevoir un boitier destiné à l'impression 3D.

![fusion360](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/37-fusion360.png)

Pour les plus accroc au code il est aussi possible de concevoir son propre firmware. Des librairies sont disponibles dans presque tous les langages et c'est ainsi qu'on se retrouve avec [KMK](https://github.com/KMKfw/kmk_firmware), un équivalent du firmware QMK écrit en Python et conçu pour fonctionner avec Circuit Python sur un Raspberry Pico ou encore diverses expérimentations de firmwares en [Rust](https://github.com/ah-/anne-key).

Mais il reste le dernier niveau, le boss final du clavier custom : le [Dactyl Manuform](https://github.com/tshort/dactyl-keyboard).

![dactyl-manuform](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/38-dactyl.jpg)

Ce niveau de customisation abandonne complètement l'idée du clavier à plat pour obtenir la forme la plus ergonomique possible. On parle ici de makers faisant imprimer en 3D des boitiers ajustés spécialement pour la taille de leurs mains. Il n'est pas rare d'y trouver des switches avec des forces d'activation différentes selon les touches.
Bref on se trouve dans la personnalisation la plus poussée mais étonnamment pas la plus inabordable depuis la démocratisation des imprimantes 3D.

# Et moi dans tout ça ?

Pour ma part l'approche que j'ai choisi pour mon clavier est de concevoir mon propre circuit.

Je suis parti d'un contrôleur [Elite-C](https://keeb.io/products/elite-c-low-profile-version-usb-c-pro-micro-replacement-atmega32u4) avec 24 I/O pins de chez Keebio avec un firmware QMK.

Tout a été conçu avec Kicad et un script Python qui permet de générer trois circuits imprimés différents à partir d’un même design.

-   pour positionner les switches (top)
-   le circuit électronique à proprement parlé (middle)
-   la back plate arborant un artwork

Les trois parties maintenues dans un châssis imprimé en 3D conçu sous Fusion 360.

Le résultat est un format 75% avec un écran Oled et encodeur rotatif pour gérer le volume du PC.

![kanagawa](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/39-kanagawa.jpg)

![kanagawa](https://raw.githubusercontent.com/Ciaanh/keyboards/main/talk/pictures/40-kanagawa.jpg)

Bien qu'encore "amateur", ce clavier représente un peu plus de 200 heures de travail et le coût des composants avoisine les 250€ pour un modèle unique et bien entendu en [OpenHarware](https://github.com/Ciaanh/keyboards/tree/main/Kanagawa).

## Références

-   **_Scanner une matrice_**http://kuku.eu.org/?projects/keyboard/index
-   **_Fonctionnement d'un switch_** https://uxdesign.cc/fascinations-on-mechanical-keyboard-228e04a535cc
-   **_Tables de référence HID_** https://usb.org/sites/default/files/hut1_3_0.pdf
-   **_Keycaps Boba Fett_** https://novelkeys.com/products/gmk-boba-fett
-   **_Comparaison de switches_** https://twitter.com/dygmalab/status/993946691068809216
-   **_Profile de touches_** https://thekeeblog.com/overview-of-different-keycap-profiles/
-   **_Choisir son clavier_** https://www.keyboard.university/
-   **_Résumé des tailles de claviers_** https://keebnews.com/keyboard-sizes/
-   **_Composants additionnels_** https://shop.pimoroni.com/
-   Dispositions de touches

    1. **_ISO vs ANSI_** https://en.wikipedia.org/wiki/Keyboard_layout
    2. **_AZERTY_** https://fr.wikipedia.org/wiki/AZERTY
    3. **_QWERTY_** https://fr.wikipedia.org/wiki/QWERTY
    4. **_AZERTY+_** https://fr.wikipedia.org/wiki/AZERTY#Version_de_la_norme_Afnor
    5. **_QWERTY international_** https://fr.wikipedia.org/wiki/QWERTY#Variantes_internationales
    6. **_DVORAK_** https://fr.wikipedia.org/wiki/Disposition_Dvorak
    7. **_BÉPO_** https://fr.wikipedia.org/wiki/B%C3%A9po

-   Exemples de claviers
    1. **_macropad_** https://www.thingiverse.com/thing:3562600
    2. **_dumbpad_** https://github.com/imchipwood/dumbpad
    3. **_Clavier 75%_** https://www.reddit.com/r/MechanicalKeyboards/comments/i40tr3/n7584_75_layout_through_hole_keyboard/
    4. **_Clavier 60%_** https://keeb.io/products/wtf60-mirrored-60-keyboard-pcb
    5. **_Clavier 40%_** https://keeb.io/products/dsp40-40-staggered-or-ortholinear-keyboard
    6. **_Clavier full size spitted_** https://keeb.io/collections/pre-built-keyboards/products/kbo-5000-keyboard-pre-built
    7. **_Ergodash_** https://github.com/omkbd/ErgoDash
    8. **_Ducky_** https://www.duckychannel.com.tw/en
    9. **_Ergodox_** https://ergodox-ez.com/
    10. **_PCB pour clavier Sinc_** https://keeb.io/collections/sinc/products/sinc-split-staggered-75-keyboard
    11. **_Clavier câblé à la main (handwired)_** https://deskthority.net/viewtopic.php?t=14224
    12. **_Dactyl Manuform_** https://www.reddit.com/r/MechanicalKeyboards/comments/dkih5b/my_dactyl_manuform_mini_with_only_one_teensy_for/
    13. **_Clavier Razer_** https://www.razer.com/fr-fr/pc/gaming-keyboards-and-keypads
