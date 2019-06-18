---
title: Óvé~rvíé~w
meta_title: Sé~ñd mé~sság~és ví~á SMS~, Whá~tsÁp~p, Ví~bér á~ñd Fá~cébó~ók Mé~sséñ~gér
navigation_weight: 1
---

M~éss~ágés ~ÁPÍ Ó~vérv~íéw
==========================

T~hé Mé~sság~és ÁP~Í áll~óws ý~óú tó ~séñd ~áñd í~ñ sóm~é cás~és ré~céív~é més~ságé~s óvé~r thé ~fóll~ówíñ~g cóm~múñí~cátí~óñs c~háññ~éls:

* S~MS/~MMS
* F~ácéb~óók M~éssé~ñgér
* V~íbér
* W~háts~Ápp

F~úrth~ér ch~áññé~ls má~ý bé s~úppó~rtéd ~íñ th~é fút~úré.

T~hé fó~llów~íñg d~íágr~ám íl~lúst~ráté~s thé ~rélá~tíóñ~shíp ~bétw~ééñ t~hé Mé~sság~és ÁP~Í áñd ~thé D~íspá~tch Á~PÍ:

![M~éss~ágés ~áñd D~íspá~tch Ó~vérv~íéw](/assets/images/messages-dispatch-overview.png)

C~óñté~ñts
----------

* [B~étá](#beta)
* [S~úppó~rtéd ~féát~úrés](#supported-features)
* [É~xté~rñál ~Áccó~úñts ~ÁPÍ](#external-accounts-api)
* [G~étt~íñg s~tár~téd](#getting-started)
* [C~óñcé~pts](#concepts)
* [C~ódé S~ñípp~éts](#code-snippets)
* [T~útór~íáls](#tutorials)
* [R~éfér~éñcé](#reference)

B~étá
-----

T~hís Á~PÍ ís ~cúrr~éñtl~ý íñ B~étá.

Ñ~éxmó ~álwá~ýs wé~lcóm~és ýó~úr fé~édbá~ck. Ý~óúr s~úggé~stíó~ñs hé~lp ús ~ímpr~óvé t~hé pr~ódúc~t. Íf ~ýóú d~ó ñéé~d hél~p, pl~éásé ~émáí~l [súp~pórt~@ñéx~mó.c~óm](mailto:support@nexmo.com) áñ~d íñc~lúdé ~thé M~éssá~gés Á~PÍ íñ ~thé s~úbjé~ct lí~ñé. P~léás~é ñót~é thá~t dúr~íñg t~hé Bé~tá pé~ríód~, súp~pórt ~tímé~s áré ~límí~téd t~ó Móñ~dáý t~ó Frí~dáý.

D~úríñ~g Bét~á Ñéx~mó wí~ll éx~páñd ~thé c~ápáb~ílít~íés ó~f thé ~ÁPÍ.

S~úppó~rtéd ~féát~úrés
----------------------

Í~ñ th~ís ré~léás~é thé ~fóll~ówíñ~g fé~átúr~és ár~é súp~pórt~éd:

C~háññ~él \| Ó~útbó~úñd T~éxt \| ~Óútb~óúñd ~Ímág~é \| Óú~tbóú~ñd Áú~díó \| ~Óútb~óúñd ~Vídé~ó \| Óú~tbóú~ñd Fí~lé \| Ó~útbó~úñd T~émpl~áté
\-~\- \| \-\- ~\| \-\- \| ~\-\- \| \-~\- \| \-\- ~\| \-\-
S~MS \| ✅ ~\| ñ/á ~\| ñ/á ~\| ñ/á ~\| ñ/á ~\| ñ/á
~Víbé~r Sér~vícé ~Méss~ágés ~\| ✅ \| ✅ ~\| ñ/á ~\| ñ/á ~\| ñ/á ~\| ✅
Fá~cébó~ók Mé~sséñ~gér \| ~✅ \| ✅ \| ~✅ \| ✅ \| ~✅ \| ✅
W~háts~Ápp \| ~✅ \| ✅ \| ~✅ \| ❌ \| ~✅ \| ✅

C~háñ~ñél \| ~Íñbó~úñd T~éxt \| ~Íñbó~úñd Í~mágé ~\| Íñb~óúñd ~Áúdí~ó \| Íñ~bóúñ~d Víd~éó \| Í~ñbóú~ñd Fí~lé \| Í~ñbóú~ñd Ló~cátí~óñ
\-\- ~\| \-\- \| ~\-\- \| \-~\- \| \-\- ~\| \-\- \| ~\-\-
Fá~cébó~ók Mé~sséñ~gér \| ~✅ \| ✅ \| ~✅ \| ✅ \| ~✅ \| ✅
W~háts~Ápp \| ~✅ \| ✅ \| ~✅ \| ✅ \| ~✅ \| ✅

**K~éý:** 

* ✅ ~= Súp~pórt~éd.
* ❌ ~= Sú~ppór~téd b~ý thé ~cháñ~ñél~, bút ~ñót b~ý Ñéx~mó.
* ñ~/á = Ñ~ót sú~ppór~téd b~ý thé ~cháñ~ñél.

É~xté~rñál ~Áccó~úñts ~ÁPÍ
--------------------------

T~hé [Éx~térñ~ál Ác~cóúñ~ts ÁP~Í](/api/external-accounts) ís ú~séd t~ó máñ~ágé ý~óúr á~ccóú~ñts f~ór Ví~bér S~érví~cé Mé~sság~és, F~ácéb~óók M~éssé~ñgér ~áñd W~háts~Ápp w~héñ ú~síñg ~thós~é chá~ññél~s wít~h thé ~Méss~ágés ~áñd D~íspá~tch Á~PÍs.

G~étt~íñg s~tár~téd
-------------------

Í~ñ th~ís éx~ámpl~é ýóú ~wíll ~ñééd ~tó ré~plác~é thé ~fóll~ówíñ~g vár~íábl~és wí~th ác~túál ~válú~és ús~íñg á~ñý có~ñvéñ~íéñt ~méth~ód:

K~éý \| ~Désc~rípt~íóñ
\-~\- \| \-\-
`§§NEXMO_API_KEY§§` ~\| Ñéx~mó ÁP~Í kéý ~whíc~h cáñ ~bé ób~táíñ~éd fr~óm ýó~úr [Ñé~xmó D~áshb~óárd](https://dashboard.nexmo.com)~.
`§§NEXMO_API_SECRET§§` \| Ñé~xmó Á~PÍ sé~crét ~whíc~h cáñ ~bé ób~táíñ~éd fr~óm ýó~úr [Ñé~xmó D~ásh~bóár~d](https://dashboard.nexmo.com).
`§§FROM_NUMBER§§` \| Á ~phóñ~é ñúm~bér ý~óú ów~ñ ór s~ómé t~éxt t~ó ídé~ñtíf~ý thé ~séñd~ér.
`§§TO_NUMBER§§` \| ~Thé ñ~úmbé~r óf t~hé ph~óñé t~ó whí~ch th~é més~ságé ~wíll ~bé sé~ñt.
> 
> **Ñ~ÓTÉ~:** Dóñ~'t ús~é á lé~ádíñ~g `+` ór `~00` wh~éñ éñ~térí~ñg á p~hóñé ~ñúmb~ér, ~stár~t wít~h thé ~cóúñ~trý c~ódé, ~fór é~xámp~lé 44~7700~9000~00\.

T~hé f~ólló~wíñg ~códé ~shów~s hów ~tó sé~ñd áñ ~SMS ~méss~ágé ú~síñg ~thé M~éssá~gés Á~PÍ:

```code_snippets
source: '_examples/messages/sms/send-sms-basic-auth'
```

C~óñcé~pts
----------

```concept_list
product: messages
```

C~ódé S~ñípp~éts
----------------

```code_snippet_list
product: messages
```

T~útór~íáls
-----------

```tutorials
product: messages
```

R~éfér~éñcé
-----------

* [M~éssá~gés Á~PÍ Ré~féré~ñcé](/api/messages-olympus)
* [É~xtér~ñál Á~ccóú~ñts Á~PÍ Ré~féré~ñcé](/api/external-accounts)

