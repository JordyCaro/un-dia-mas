# Enjoy Journey — Master Design Document v2.0

> Documento de diseño completo para app móvil (iOS/Android). Juego contemplativo aliado al ecosistema Enjoy.  
> **Contenido narrativo:** Prólogo + 9 mundos + 180 niveles + epílogo (183 experiencias jugables).

## Índice rápido

| Sección | Contenido |
|---------|-----------|
| 1–9 | Visión, filosofía, gameplay, loop |
| **10** | **Mundos, historias completas y tabla de los 183 niveles** |
| 11–17 | Recuerdos, frases, personalización, música, monetización, tech |
| 18–20 | MVP, roadmap, redes |
| 21–24 | Experiencia móvil, Enjoy, arte, datos |
| 25–26 | Métricas y visión largo plazo |
| **27–29** | **Manifiesto Enjoy, modo contemplación, checklist pre-desarrollo** |

---

## Proyecto

**Nombre de la app:** Un Día Más  
**Nombre internacional (store EN):** One More Day  
**Identidad visual / personaje:** La Luz — la Chispa que guía al jugador  
**Idioma:** Español (v1.0). Localización EN en fases posteriores.  
**País inicial (recursos de crisis):** Colombia  

```
Marca:     Un Día Más
Personaje: La Chispa / La Luz
Paquete:   un_dia_mas
Deep link: undiomas://capitulo/{id}/nivel/{id}
```

---

# 1. Visión

No construimos un juego sobre salud mental.

Construimos un juego sobre seguir adelante.

La diferencia es enorme.

Las personas no abren una aplicación pensando:

"Quiero trabajar mi salud mental".

Las personas abren una aplicación pensando:

- Quiero distraerme.
- Quiero relajarme.
- Quiero sentir progreso.
- Quiero desconectarme.
- Quiero respirar.

Enjoy Journey busca convertirse en una experiencia interactiva capaz de transmitir el mismo sentimiento que transmiten los videos de Enjoy.

La sensación final debe ser:

"Bueno... puedo intentar un día más."

---

# 2. Qué es Enjoy

Enjoy nació como una iniciativa tecnológica relacionada con bienestar emocional.

Con el tiempo evolucionó hacia una comunidad de contenido enfocada en:

- Salud mental
- Bienestar emocional
- Resiliencia
- Reflexión
- Motivación realista
- Acompañamiento emocional

No es contenido de autoayuda tradicional.

No promete felicidad instantánea.

No promete éxito.

No promete sanar.

Su mensaje principal es:

"Sigue adelante."

---

# 3. Relación entre Enjoy y el juego

El juego NO es Enjoy.

El juego es una puerta de entrada al ecosistema Enjoy.

Objetivos:

- Dar visibilidad a la marca.
- Crear una comunidad.
- Validar productos digitales.
- Crear una experiencia interactiva.
- Generar una fuente de ingresos sostenible.

---

# 4. Premisa

El mundo perdió la luz.

No por una guerra.

No por un monstruo.

No por una catástrofe.

Simplemente se apagó.

Poco a poco.

Como muchas personas.

El jugador controla una pequeña chispa.

Una luz.

Una presencia.

No tiene nombre.

No tiene rostro.

Podría ser cualquiera.

Su única misión:

Llegar a mañana.

---

# 5. Filosofía de Diseño

Reglas fundamentales:

1. No violencia.
2. No combate.
3. No estrés artificial.
4. No pay-to-win.
5. No castigar al jugador.
6. No fomentar adicción agresiva.
7. Priorizar bienestar emocional.
8. Recompensar curiosidad.
9. Recompensar exploración.
10. Priorizar atmósfera.

---

# 6. Inspiraciones

Visuales:
- Journey
- Gris
- Monument Valley
- Alto's Odyssey
- Alto's Adventure
- Sky: Children of the Light

Emocionales:
- Videos de Enjoy
- Reflexiones personales
- Narrativas contemplativas

---

# 7. Gameplay Principal

El jugador:

- Camina
- Explora
- Descubre recuerdos
- Resuelve puzzles simples (nunca cronometrados con castigo)
- Desbloquea frases
- Desbloquea paisajes
- Respira (mecánica central de calma)
- Continúa avanzando

No existe Game Over tradicional. Si la chispa se apaga, revive con: *"Todavía estás aquí."*

## Tipos de puzzle (rotación)

| Tipo | Descripción | Capítulos |
|------|-------------|-----------|
| Camino invisible | Solo ves cerca de la chispa | Niebla |
| Refugio | Zonas seguras temporales | Lluvia, Tormenta |
| Filtro de atención | Ignorar estímulos | Ruido |
| Dejar marca | Huellas, piedras, mensajes | Soledad |
| Resistir | Viento, oscuridad; respirar ayuda | Tormenta |
| Apertura | Luz que crece, colores que vuelven | Amanecer |
| Crecimiento | Plantas, tiempo entre sesiones | Bosque |
| Cooperación | Dos luces, fantasmas | Encuentros |
| Constelación | Conectar puntos del viaje | Estrellas |

---

# 8. Loop Principal

Entrar

→ Explorar

→ Descubrir recuerdo

→ Desbloquear frase

→ Obtener progreso

→ Desbloquear nuevo escenario

→ Continuar

---

# 9. Historia General

La historia se cuenta mediante:

- Escenarios
- Objetos
- Música
- Frases
- Recuerdos

Nunca mediante largos diálogos.

Nunca se mencionan directamente:

- Depresión
- Ansiedad
- Trauma

Todo es metafórico.

---

# 10. Capítulos — Mundos, Historias y Niveles

> **Convención de niveles:** Cada nivel dura 3–8 minutos. Al completarlo se desbloquea el recuerdo, la frase y el siguiente nivel. No hay Game Over: si la chispa se apaga, revive donde estaba con un susurro: *"Todavía estás aquí."*

---

## Prólogo — La Chispa (Tutorial narrativo)

### Historia del mundo

Antes de los mundos, antes de la niebla, solo hay negro. No es un negro amenazante: es el negro de cerrar los ojos demasiado tiempo. En ese vacío algo parpadea una vez. Luego otra. La Chispa no sabe de dónde viene ni hacia dónde va. Solo sabe que si deja de moverse, el negro se siente más pesado. Una voz lejana — podría ser la tuya — susurra que no necesita llegar al final del universo. Solo necesita llegar a mañana.

### Identidad visual y sonora

- Paleta: negro profundo, un punto de luz cálida (#FFD89B).
- Música: un solo piano, nota larga, silencios amplios.
- Sin UI excepto un halo sutil alrededor de la chispa.

### Niveles del Prólogo

| Nivel | Nombre | Historia | Mecánica | Recuerdo | Frase |
|-------|--------|----------|----------|----------|-------|
| P1 | El Parpadeo | La chispa aparece. El mundo no existe aún. | Aprender a caminar hacia la única mota de luz visible. | — | — |
| P2 | El Aliento | La oscuridad pulsa al ritmo de una respiración. | Mantener presionado para respirar; el pulso se calma. | Polvo de estrella | "Respira. Todavía estás aquí." |
| P3 | El Primer Paso | Un sendero se dibuja solo donde la chispa camina. | Caminar hasta el borde; interactuar con una mota final. | Semilla de luz | "No necesitas llegar al final. Solo llega a mañana." |

---

## Capítulo 1 — La Niebla (Niveles 1–20)

### Historia completa del mundo

La Niebla no llegó de golpe. Se filtró como cuando un día pierdes la certeza de para qué te levantaste. La Chispa entra en un llano infinito donde no se ve más de tres pasos adelante. No hay enemigos: hay direcciones que desaparecen. A medida que avanza, encuentra objetos de gente que también caminó sin mapa — una bota abandonada, una brújula que no funciona, una nota a medio escribir. La Niebla representa la confusión de no entender qué te pasa, de buscar respuestas que no llegan. El arco del capítulo va de la parálisis (¿y si elijo mal?) a la aceptación de que caminar sin claridad ya es una forma de valentía. Al nivel 20, la niebla se abre un instante y a lo lejos se ve una ciudad bajo la lluvia. La Chispa no sabe si está lista. Camina igual.

**Metáfora emocional:** Confusión, desorientación, "no sé qué me pasa".  
**Mecánica distintiva:** Visibilidad limitada; faros que se encienden al encontrar recuerdos.  
**Paleta:** Grises azulados, blancos lechosos, luz ámbar de la chispa.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 1 | Donde Estoy | La chispa despierta dentro de la niebla. No hay horizonte. | Tutorial: caminar en niebla con radio de luz pequeño. | Huella en el barro | "Un paso sigue siendo un paso." |
| 2 | Sin Mapa | Encuentra una brújula rota en el suelo. Apunta a todos lados. | Seguir un sendero invisible que solo aparece cerca de la chispa. | Brújula rota | "No necesitas tenerlo todo claro." |
| 3 | Tres Caminos | Tres senderos se abren. Ninguno parece correcto. | Elegir cualquier camino (todos llegan al mismo lugar). | Bifurcación de madera | "No hay un solo camino correcto." |
| 4 | La Nota | Una nota a medio escribir: "Si lees esto, yo también..." | Recoger objetos que brillan débilmente en la niebla. | Nota a medio escribir | "Otros han pasado por aquí." |
| 5 | El Eco | Voces repiten lo que la chispa no dijo. | Seguir ecos de pasos (audio direccional suave). | Campana oxidada | "No estás inventando esto." |
| 6 | El Faro Apagado | Una torre sin luz. Al acercarse, algo responde. | Encender un faro tocándolo; la niebla retrocede un poco. | Mecha sin encender | "A veces alguien dejó luz para ti." |
| 7 | El Puente | Un puente apenas visible sobre un vacío. | Cruzar despacio; respirar estabiliza el puente. | Tablón con nombre tallado | "Avanzar despacio también es avanzar." |
| 8 | La Silla | Una silla vacía en medio de la niebla. Alguien se sentó aquí. | Opción de sentarse (pausa contemplativa) o seguir. | Bufanda olvidada | "Descansar no es rendirse." |
| 9 | El Reloj | Un reloj detenido marca las tres. | Puzzle: alinear tres luces con el reloj para abrir un arco. | Reloj detenido | "No todo tiene que tener prisa." |
| 10 | La Mitad | La chispa no sabe si va por la mitad o por el principio. | Nivel circular: volver al inicio revela un nuevo camino. | Mitad de fotografía | "No saber dónde estás no significa no estar avanzando." |
| 11 | Las Piedras | Piedras apiladas dejan rastro de otros caminantes. | Apilar tres piedras para marcar el camino (las tuyas quedan). | Piedra con símbolo | "Tu camino también cuenta." |
| 12 | El Susurro | La niebla susurra dudas. | Caminar mientras los susurros se apagan al respirar. | Pluma | "No todo lo que piensas es verdad." |
| 13 | El Espejo | Un charco refleja no la chispa, sino un cielo despejado. | Tocar el charco cambia la niebla momentáneamente. | Fragmento de espejo | "A veces el cielo sigue ahí arriba." |
| 14 | La Linterna | Encuentra una linterna apagada. La chispa la enciende con su luz. | La linterna amplía el radio de visión por el resto del nivel. | Linterna vieja | "Tu luz puede encender otras cosas." |
| 15 | El Nombre | Una piedra tiene un nombre tallado. No es el tuyo. Pero duele igual. | Puzzle de emparejar símbolos en piedras (sin texto explícito). | Piedra tallada | "El dolor de otros no quita el tuyo." |
| 16 | La Subida | Una colina que no se veía antes. | Subir una pendiente suave; la niebla se espesa arriba. | Cuerda enrollada | "Lo difícil no significa imposible." |
| 17 | El Refugio | Una choza con luz tenue adentro. Nadie está. | Explorar el interior; encontrar recuerdos de quien se fue. | Taza de té fría | "Alguien cuidó este lugar antes que tú." |
| 18 | La Despedida | Cartas al viento, sin destinatario. | Seguir el viento (partículas) hasta un acantilado. | Carta sin sobre | "No necesitas resolver toda tu vida hoy." |
| 19 | El Borde | La niebla empieza a moverse como ola. | Caminar contra la corriente de niebla usando faros. | Farol portátil | "Sigue. Aunque no veas el final." |
| 20 | La Apertura | Por un segundo, la niebla se abre. Se ve lluvia lejos. | Caminar hacia la luz lejana; transición al Cap. 2. | Llave de lluvia | "No necesitas entenderlo todo para avanzar." |

---

## Capítulo 2 — La Lluvia (Niveles 21–40)

### Historia completa del mundo

La Chispa baja de la niebla hacia una ciudad sumergida en lluvia constante. No es una tormenta: es esa lluvia que cae durante días y convierte cada ventana en un espejo triste. Las calles reflejan neones apagados. Un metro fantasma recorre túneles donde la gente dejó paraguas, libros mojados y conversaciones a medias. La Lluvia es la tristeza que no pide permiso — no grita, solo empapa. La Chispa aprende que no tiene que "dejar de sentir" para moverse: puede caminar mojada. Encuentra refugios pequeños (un café cerrado con luz dentro, un banco bajo un toldo) que no eliminan la lluvia pero hacen el camino soportable. En el nivel 40, la lluvia no cesa, pero la chispa encuentra un paraguas transparente: no la protege del todo, le permite ver el cielo mientras camina. Hacia el horizonte, un zumbido lejano — la ciudad del ruido.

**Metáfora emocional:** Tristeza, melancolía, días grises.  
**Mecánica distintiva:** Charcos que reflejan recuerdos; refugios que restauran la luz; lluvia constante en audio.  
**Paleta:** Azul petróleo, gris urbano, reflejos dorados.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 21 | La Primera Gota | La niebla se convierte en lluvia. La chispa entra a la ciudad. | Introducción a lluvia visual y refugios. | Gota en un vaso | "Puedes seguir aunque llueva." |
| 22 | Ventanas | Cada ventana muestra una vida que sigue adentro. | Caminar por callejón; mirar ventanas (interactuar). | Marco de ventana | "La vida continúa, incluso cuando tú no lo sientes." |
| 23 | El Paraguas Roto | Un paraguas volcado en el charco. | Puzzle: recoger varillas y abrir paraguas parcialmente. | Paraguas roto | "No necesitas estar bien para seguir." |
| 24 | El Metro | Bajón a un metro vacío. Vías que brillan débilmente. | Seguir las vías; evitar charcos profundos (caer = reaparecer). | Boleto de metro | "A veces el camino es bajar, no subir." |
| 25 | El Banco | Un banco bajo un toldo. La lluvia golpea el metal. | Sentarse opcional; escuchar la lluvia 10 seg = recuerdo. | Periódico mojado | "Quedarte un momento no es quedarte para siempre." |
| 26 | La Cafetería | Un café con luz adentro. Puerta entreabierta. | Entrar al interior (contraste cálido/frío). | Taza con labial | "Los refugios pequeños importan." |
| 27 | La Carta Mojada | Una carta casi ilegible en un charco. | Secar la carta cerca de la chispa (mantener cerca). | Carta borrosa | "Algunas cosas se pierden. No todo." |
| 28 | El Puente de Luces | Un puente sobre un río que lleva lluvia. | Cruzar con luces que se encienden al pasar. | Candado sin llave | "Sobrevivir también cuenta." |
| 29 | La Estación | Una estación de metro con un solo cartel legible: "→" | Seguir flechas en el suelo a través de pasillos. | Mapa arrugado | "Has llegado más lejos de lo que crees." |
| 30 | El Reflejo | Charcos muestran no la chispa, sino momentos ajenos. | Tocar charcos para ver micro-recuerdos (sin texto). | Moneda en el agua | "Tu historia no es la única difícil." |
| 31 | La Escalera | Escaleras que suben hacia un tejado. | Subir escaleras; la lluvia se intensifica arriba. | Guantes mojados | "Subir duele. Bajar también." |
| 32 | El Tejado | Tejado con ropa tendida que nunca secó. | Caminar entre tendederos; la luz filtra entre telas. | Camisa colgando | "Algo sigue esperando secarse." |
| 33 | La Radio | Una radio en el tejado capta estática y un fragmento de melodía. | Sintonizar (puzzle de dial circular). | Radio portátil | "A veces un poco de música ayuda." |
| 34 | El Autobús | Un autobús detenido, puertas abiertas. Nadie sube. | Recorrer el interior; asientos con objetos. | Billete doblado | "No todo el mundo llega al mismo tiempo." |
| 35 | La Librería | Librería cerrada; libros visibles tras el cristal. | Alinear libros desde fuera para formar un patrón. | Libro con dedicatoria | "Las palabras de otros pueden sostenerte." |
| 36 | El Parque | Un parque vacío con columpios que se mueven solos. | Empujar un columpio (interacción); caminar entre árboles. | Pluma de pájaro | "El silencio también tiene movimiento." |
| 37 | La Llamada | Un teléfono público suena una vez. | Contestar (opcional): audio de respiración al otro lado. | Auricular colgando | "Alguien intentó comunicarse." |
| 38 | El Último Refugio | Una cabina telefónica seca. La lluvia golpea afuera. | Pausa contemplativa; salir cuando el jugador quiera. | Foto en la cabina | "Llega vivo al siguiente capítulo." |
| 39 | La Corriente | Calles que se inundan. | Caminar por banquetas altas; puzzle de bloques flotantes. | Botas de goma | "Cuando el agua sube, busca lo más alto que puedas." |
| 40 | El Paraguas Transparente | La lluvia no para. Pero la chispa encuentra un paraguas que deja ver el cielo. | Equipar paraguas; caminar hacia el zumbido lejano. | Paraguas transparente | "Puedes seguir avanzando incluso cuando llueve." |

---

## Capítulo 3 — El Ruido (Niveles 41–60)

### Historia completa del mundo

Tras la lluvia, la Chispa llega a una metrópolis que nunca duerme — no por vida, sino por ruido. Pantallas, alarmas, notificaciones hechas partículas, multitudes que no hablan sino que vibran. El Ruido es la ansiedad: todo pide atención a la vez. La chispa empieza pequeña, casi apagada por el volumen del mundo. Poco a poco aprende a filtrar: algunas fuentes se apagan al ignorarlas, otras son importantes y brillan distinto. No se trata de silenciar todo (eso también asusta), sino de elegir qué merece quedarse. En el nivel 60, la ciudad no se calla — la chispa simplemente ya no la escucha toda. Camina hacia un suburbio vacío donde el silencio pesa de otra forma.

**Metáfora emocional:** Ansiedad, sobrecarga, mente acelerada.  
**Mecánica distintiva:** Fuentes de ruido que distraen; mecánica de "atención" (mirar vs ignorar); audio multicapa.  
**Paleta:** Neón, rojos de alerta, negro urbano, pulsos visuales.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 41 | El Zumbido | Al salir de la lluvia, un zumbido constante. | Caminar con audio abrumador que baja al respirar. | Tapones para oídos | "No todo merece tu atención." |
| 42 | Las Pantallas | Pantallas muestran mensajes sin sentido. | Ignorar pantallas (no mirar) para abrir paso. | Pantalla rota | "No todo lo urgente es importante." |
| 43 | La Multitud | Siluetas que empujan sin tocar. | Mantener el centro del camino respirando. | Pasaporte | "Puedes estar en medio y aún ser tú." |
| 44 | La Alarma | Una alarma que no para. | Encontrar tres interruptores (solo uno importa). | Llave de interruptor | "No tienes que responder a todo." |
| 45 | El Café Ruidoso | Un café lleno de conversaciones superpuestas. | Identificar una melodía entre el ruido (puzzle auditivo). | Azucarero | "Busca una sola cosa bonita." |
| 46 | Las Notificaciones | Partículas rojas saltan hacia la chispa. | Dejar que algunas pasen sin tocarlas. | Teléfono en silencio | "Puedes poner el mundo en silencio un momento." |
| 47 | El Cruce | Un cruce donde todo cambia de color rápido. | Cruzar cuando la luz está en "respirar" (verde suave). | Semáforo miniatura | "Esperar un momento no es perder." |
| 48 | La Oficina | Cubículos infinitos con luces fluorescentes. | Caminar entre escritorios; apagar luces innecesarias. | Taza "World's Okayest" | "Está bien ser solo suficiente." |
| 49 | El Ascensor | Un ascensor que sube y baja sin parar. | Entrar y elegir un piso (cualquiera funciona). | Botón de ascensor | "No controlas todo. Controlas tu siguiente paso." |
| 50 | La Plaza | Una plaza con un reloj que marca tiempo acelerado. | Caminar lento mientras el mundo corre (mecánica tiempo). | Reloj de bolsillo | "Tu ritmo es válido." |
| 51 | El Megáfono | Voces amplificadas repiten miedos genéricos. | Tapar "oídos" de la chispa caminando por zonas de silencio. | Auriculares | "Puedes elegir qué escuchar." |
| 52 | El Laberinto de Espejos | Espejos distorsionan la chispa en mil versiones. | Romper espejos falsos tocando solo el reflejo verdadero. | Fragmento de espejo limpio | "No eres todas las versiones que temes." |
| 53 | La Sirena | Una sirena lejana (ambulancia, no peligro). | Seguir la sirena hasta un hospital luminoso vacío. | Pulsera hospitalaria | "Pedir ayuda es humano." |
| 54 | El Hospital Vacío | Pasillos blancos, silencio repentino. | Explorar salas; la quietud también inquieta. | Flor en un jarrón | "El silencio después del ruido también cuesta." |
| 55 | La Ventana Alta | Desde un edificio alto, la ciudad parece más pequeña. | Subir y mirar abajo (contemplación). | Binoculares | "A veces necesitas perspectiva, no respuestas." |
| 56 | El Pájaro | Un pájaro canta entre el concreto. | Seguir el canto (audio) hasta un árbol en la acera. | Pluma brillante | "Lo pequeño sobrevive al ruido." |
| 57 | El Filtro | La chispa aprende a brillar solo en cierta frecuencia. | Puzzle: sincronizar luz con ondas que se cancelan. | Filtro de luz | "Puedes cambiar qué te afecta." |
| 58 | La Salida | Señales de salida en todas direcciones. | Elegir una salida al azar (todas llevan al suburbio). | Señal de salida | "No hay una sola forma de salir." |
| 59 | El Umbral | El ruido queda atrás como una pared. | Caminar por un túnel que amortigua el sonido. | Puerta de aislamiento | "Dejar atrás no es olvidar." |
| 60 | El Silencio Raro | El suburbio está vacío. El silencio pesa. | Transición: caminar en silencio casi total. | Llave del vacío | "El silencio también puede asustar." |

---

## Capítulo 4 — La Soledad (Niveles 61–80)

### Historia completa del mundo

El suburbio vacío se extiende hasta convertirse en una llanura de casas sin gente. No hay monstruos en las ventanas: hay ausencia. La Soledad no es castigo; es un territorio donde la Chispa solo tiene su luz. Encuentra mesas puestas para dos, columpios con un solo asiento usado, mensajes en neveras que nadie leerá. La narrativa no romantiza la soledad ni la demoniza — la muestra como un lugar por donde se pasa. La Chispa descubre que puede sostenerse a sí misma: cantar (mecánica de pulso de luz), dejar marcas para futuros viajeros, hablarle a objetos sin que respondan y aun así sentirse menos vacía. En el nivel 80, en la colina más alta, ve otras chispas lejanísimas — no sabe si son reales o esperanza. Baja hacia ellas. El cielo se oscurece.

**Metáfora emocional:** Aislamiento, vacío, sentirse invisible.  
**Mecánica distintiva:** Espacios amplios; eco de tus propios pasos; objetos que "guardan" mensajes del jugador.  
**Paleta:** Beige deslavado, azul crepuscular, puntos de luz distantes.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 61 | La Casa Vacía | La primera casa sin nadie. Puerta abierta. | Explorar habitaciones vacías. | Llave bajo el felpudo | "Estar solo no significa estar perdido." |
| 62 | La Mesa | Dos platos. Uno solo usado. | Interactuar con objetos domésticos. | Tenedor solitario | "La ausencia también tiene forma." |
| 63 | El Jardín | Un jardín que alguien dejó crecer. | Regar plantas secas con la luz de la chispa. | Semillas | "Algo puede crecer aunque no estés listo." |
| 64 | La Bicicleta | Una bici contra la pared, esperando. | Empujar la bici un tramo (compañía temporal). | Timbre de bici | "No necesitas compañía para moverte." |
| 65 | El Espejo del Baño | El espejo muestra solo la chispa. | Quedarse mirando (opcional) o seguir. | Cepillo de dientes | "Contigo también puedes hablar." |
| 66 | La Nevera | Notas magnéticas sin firma. | Reordenar notas para formar una frase amable. | Imán de flor | "Déjate mensajes bonitos." |
| 67 | El Ático | Un ático con cajas sin abrir. | Abrir cajas (tres máximo); encontrar recuerdos. | Álbum de fotos en blanco | "No todo pasado se ve claro." |
| 68 | La Colina | Una colina con un solo árbol. | Subir y sentarse bajo el árbol. | Hoja seca | "Un lugar puede ser solo tuyo." |
| 69 | La Marca | La chispa deja una marca de luz en un muro. | Mecánica de "dejar rastro" para marcar camino. | Tiza luminosa | "Tu paso deja huella." |
| 70 | El Eco Propio | Los pasos tardan en responder. | Caminar y escuchar el eco (audio delay). | Concha marina | "Tu voz vuelve a ti." |
| 71 | La Hamaca | Una hamaca entre dos postes. | Balancear (interacción suave). | Manta tejida | "El descanso solitario también sana." |
| 72 | El Pozo | Un pozo profundo. Al hablar, tarda en responder. | Enviar un pulso de luz al pozo; esperar respuesta. | Cubo | "A veces la respuesta eres tú." |
| 73 | El Perro | Un perro de luz duerme en un porche. | Acariciar (la chispa crece un poco). | Hueso de luz | "El contacto no siempre es humano." |
| 74 | La Carta a Nadie | Escribir una carta simbólica (frases predefinidas amables). | Elegir una frase para "enviar" al viento. | Sobre sellado | "Decirlo ayuda, aunque nadie lea." |
| 75 | El Puente Solo | Un puente sobre un río sin barandilla. | Cruzar despacio; respirar en el centro. | Cuerda | "Puedes cruzar sin que nadie te vea." |
| 76 | La Estrella Falsa | Una estrella fija en el cielo, demasiado cerca. | Llegar a ella (es una lámpara en un poste). | Bombilla | "A veces la esperanza es casera." |
| 77 | El Invierno Suave | Nieve ligera sin frío mortal. | Caminar dejando huellas que desaparecen. | Copo en la mano | "Las huellas no tienen que durar para contar." |
| 78 | La Cabaña | Una cabaña con chimenea apagada. | Encender chimenea con la chispa. | Leña | "Calentar tu espacio es un acto de cuidado." |
| 79 | La Colina Alta | Desde arriba, luces lejanísimas parpadean. | Contemplar; zoom al horizonte. | Prismáticos | "No estás tan solo como crees." |
| 80 | Las Luces Lejanas | Las luces no se acercan. Pero existen. | Bajar la colina; el cielo se oscurece (transición). | Brújula de chispas | "Ver luz lejos también alimenta." |

---

## Capítulo 5 — La Tormenta (Niveles 81–100)

### Historia completa del mundo

El cielo se rompe. No es metáfora suave: es viento que empuja, relámpagos que ciegan un segundo, caminos que desaparecen bajo escombros de luz. La Tormenta es la crisis — ese momento en que todo lo aprendido parece insuficiente. La Chispa no puede "resolver" la tormenta; solo atravesarla. A veces retrocede. A veces se apaga y revive. El capítulo no castiga: cada caída trae la frase "Todavía estás aquí." Encuentra refugios brevísimos (un hueco en la roca, un segundo entre truenos) que no prometen seguridad eterna pero permiten el siguiente paso. En el nivel 100, la tormenta alcanza su pico. La chispa se agacha, respira, y cuando abre los "ojos" el viento empieza a calmarse. No porque ganó. Porque siguió.

**Metáfora emocional:** Crisis emocional, desesperación, momento de "no puedo más".  
**Mecánica distintiva:** Viento que empuja; refugios temporales; la luz parpadea pero no muere.  
**Paleta:** Violeta oscuro, blanco de relámpago, chispa que tiembla.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 81 | El Primer Trueno | Un trueno sin lluvia. El suelo vibra. | Caminar entre ráfagas de viento (empuje suave). | Placa de metal | "Sigue. Solo sigue." |
| 82 | El Camino que Se Va | El sendero desaparece con cada rayo. | Memorizar ruta breve; reaparece tras respirar. | Cuerda guía | "El camino puede volver." |
| 83 | El Refugio Breve | Una grieta en la roca. | Entrar; la tormenta ruge afuera 15 seg; salir. | Manta impermeable | "Un momento de calma basta." |
| 84 | El Río Crecido | Un río hinchado cruza el paso. | Saltar piedras inestables (sin castigo duro). | Piedra pulida | "Tropezar no es quedarse." |
| 85 | El Árbol Caído | Un árbol bloquea el camino. | Rodear o pasar por debajo (dos rutas). | Rama | "Hay más de una forma de pasar." |
| 86 | La Linterna Apagada | El viento apaga la luz extra. Solo queda la chispa. | Completar tramo con radio de luz mínimo. | Mecha nueva | "Tu luz basta." |
| 87 | El Grito del Viento | El viento imita voces conocidas (abstractas). | Respirar para silenciar las voces falsas. | Tapón de corcho | "No todo lo que escuchas es real." |
| 88 | El Puente Colgante | Un puente se balancea. | Cruzar lento; parar si balancea demasiado. | Clavo | "El miedo no cancela el cruce." |
| 89 | La Torre | Una torre para vigilar la tormenta. | Subir en espiral; cada piso más ventoso. | Bandera rota | "Mirar la tormenta no la detiene." |
| 90 | El Ojo | En el centro, un ojo de calma de 20 segundos. | Quedarse en el círculo de calma. | Anillo de piedra | "El centro existe, aunque sea pequeño." |
| 91 | El Regreso | El camino atrás también está tormentoso. | Solo se puede avanzar (mensaje suave, no punitivo). | Flecha tallada | "Atrás ya no es igual." |
| 92 | Las Manos | Huellas de manos en un muro bajo un alero. | Colocar la chispa en las huellas (encaje). | Guante | "Otros se refugiaron aquí." |
| 93 | El Trueno Cerca | Relámpagos frecuentes ciegan un instante. | Caminar entre flashes memorizando obstáculos. | Gafas oscuras | "Ceguera temporal no es fin." |
| 94 | La Orilla | Un acantilado sin barandilla. | Seguir la orilla con viento lateral. | Ancla simbólica | "No mires abajo si no ayuda." |
| 95 | El Naufragio | Restos de algo que parecía un barco de papel. | Recoger papeles y recomponer un barco (puzzle). | Barco de papel | "Lo frágil también viajó lejos." |
| 96 | La Cuerda | Una cuerda atada a algo invisible arriba. | Trepar simbólicamente (QTE suave de ritmo). | Mosquetón | "Sujetarte no es debilidad." |
| 97 | El Segundo Ojo | Otro círculo de calma, más largo. | Respirar 30 seg; la tormenta baja un poco. | Amuleto | "Respirar es resistir." |
| 98 | La Pendiente | Bajada empinada con viento a favor. | Dejarse llevar controladamente. | Rueda pequeña | "A veces el viento ayuda." |
| 99 | El Último Trueno | El trueno más fuerte. Pantalla blanca un instante. | Caminar inmediatamente después del flash. | Silbato | "Después del golpe, sigue el paso." |
| 100 | El Pico | La tormenta en su punto más alto. | Agacharse y respirar hasta que amaine (cinemática). | Pluma del viento | "Sobrevivir esto también cuenta." |

---

## Capítulo 6 — El Amanecer (Niveles 101–120)

### Historia completa del mundo

Después del pico, el viento afloja. El horizonte se tiñe de naranja pálido. El Amanecer no borra lo vivido — la tormenta dejó marcas en el terreno — pero demuestra que las noches largas terminan. La Chispa atraviesa un valle donde la niebla, la lluvia y el ruido quedaron como ecos lejanos. Flores que no estaban ayer brotan en grietas. El mensaje no es "ya estás curado"; es "llegó la mañana otra vez." Encuentra objetos de gratitud pequeña: una taza de té caliente, un mensaje de buenos días en un buzón, huellas que van en la misma dirección que la suya. Al nivel 120, el sol está alto pero suave. Un bosque verde se abre adelante. La chispa entra sin prisa.

**Metáfora emocional:** Esperanza realista, alivio después de crisis, día nuevo.  
**Mecánica distintiva:** Luz creciente gradual; colores que se saturan; puzzles de apertura (cosas que se abren al amanecer).  
**Paleta:** Durazno, rosa alba, dorado suave, verdes que regresan.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 101 | La Primera Franja | Una línea naranja en el horizonte. | Caminar hacia la luz creciente. | Fragmento de cielo | "Las tormentas terminan." |
| 102 | El Charco Tranquilo | Charcos reflejan el amanecer, no la tormenta. | Cruzar charcos que ahora reflejan recuerdos buenos. | Espejo de agua | "El reflejo puede cambiar." |
| 103 | Las Flores | Flores en grietas del suelo roto. | Tocar flores; cada una emite una nota musical. | Flor seca guardada | "Algo crece donde hubo ruptura." |
| 104 | El Buzón | Un buzón con una tarjeta: "Buenos días." | Abrir buzón (interacción). | Tarjeta sin remitente | "Un buen día puede empezar sin razón." |
| 105 | El Té | Una mesa con té aún humeante. Nadie visible. | Sentarse; la luz de la chispa calienta la taza. | Taza con sol dibujado | "Los pequeños cuidados importan." |
| 106 | El Campo | Un campo que la tormenta aplastó empieza a levantarse. | Caminar entre tallos que se enderezan al pasar. | Espiga | "Lo doblado puede volver a subir." |
| 107 | El Pájaro Otra Vez | El mismo canto del capítulo 3, pero claro. | Seguir el canto hasta un nido con un huevo. | Pluma dorada | "Lo que sobrevivió regresa." |
| 108 | El Puente Reparado | El puente caído ahora tiene tablones nuevos. | Cruzar; dejar una marca de luz de agradecimiento. | Clavo dorado | "Alguien reparó esto. Tú también puedes." |
| 109 | La Fuente | Una fuente con agua clara. | Beber (animación); la chispa brilla más estable. | Vaso de cristal | "Beber agua es un logro algunos días." |
| 110 | El Sendero de Huellas | Huellas que van en la misma dirección. | Seguir huellas que a veces se superponen con las tuyas. | Bota pequeña | "Otros también buscaron la mañana." |
| 111 | La Colina Suave | Una subida sin viento. | Subir contemplando el valle iluminado. | Mochila ligera | "Subir sin miedo es nuevo." |
| 112 | El Molino | Un molino de viento girando lento, ya no furioso. | Activar aspas con luz en el momento correcto. | Aspa miniatura | "El viento puede ser aliado." |
| 113 | El Mercado Vacío | Puestos cubiertos pero ordenados, como si volvieran pronto. | Ordenar objetos en puestos (puzzle gentil). | Moneda de sol | "La vida puede volver a los espacios." |
| 114 | La Campana | Una campana suena sola una vez al amanecer. | Llegar cuando suena (timing suave). | Badajo | "Algunos momentos son para escuchar." |
| 115 | El Arcoíris Tenue | Un arcoíris apenas visible sobre el valle. | Caminar bajo él; colores bañan la pantalla. | Fragmento de arcoíris | "La belleza no pide permiso." |
| 116 | La Piedra de Gratitud | Una piedra donde otros dejaron marcas. | Añadir tu marca (símbolo elegido). | Cincel | "Agradecer no borra el dolor." |
| 117 | El Regreso del Color | El mundo pasa de gris a color gradual. | Atravesar zonas que se colorean al tocarlas. | Pincel | "El color vuelve poco a poco." |
| 118 | El Abrazo de Luz | Dos árboles forman un arco natural. | Pasar bajo el arco (cinemática breve). | Rama entrelazada | "Puedes permitirte sentir alivio." |
| 119 | El Sol Bajo | El sol está alto pero no quema. | Caminar hacia un bosque visible. | Gafas de sol | "La luz puede ser suave." |
| 120 | La Entrada al Bosque | El bosque verde se abre. La tormenta queda atrás. | Entrar al bosque (transición al Cap. 7). | Hoja nueva | "Llegaste a otra mañana." |

---

## Capítulo 7 — El Bosque (Niveles 121–140)

### Historia completa del mundo

El Bosque no es escape del pasado: es donde el pasado se convierte en raíz. Árboles tienen anillos que brillan cuando la chispa pasa — cada anillo, un capítulo anterior en ecos visual. Sanar aquí no es olvidar la niebla o la tormenta; es integrarlas. La Chispa aprende paciencia: un brote no crece en un nivel, un sendero se despeja solo si vuelves otro día (mecánica opcional de "crecimiento entre sesiones" para el jugador recurrente). Encuentra herramientas de cuidado: regadera, tijeras, banco para sentarse años (metafóricamente). El bosque tiene estaciones en miniatura dentro de niveles — hojas que caen, musgo que sube. En el nivel 140, la chispa planta la Semilla de Luz del prólogo. No sabe qué será. La planta. Sigue caminando hacia luces que se mueven.

**Metáfora emocional:** Sanación lenta, crecimiento, paciencia con uno mismo.  
**Mecánica distintiva:** Plantas que crecen entre sesiones; caminos que se abren con el tiempo; anillos de árbol como flashbacks.  
**Paleta:** Verdes profundos, musgo, marrón tierra, luz filtrada.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 121 | El Umbral Verde | La primera hoja toca la chispa. | Entrar al bosque; tutorial de plantas interactivas. | Hoja | "Sanar también es crecer." |
| 122 | Los Anillos | Un árbol muestra anillos que brillan (niebla, lluvia, tormenta...). | Tocar anillos para ver ecos de 1 seg de capítulos pasados. | Rodaja de madera | "Lo vivido forma parte de ti." |
| 123 | El Sendero Oculto | Un sendero tapado por ramas. | Apartar ramas (interacción repetida suave). | Tijeras | "Abrir camino lleva tiempo." |
| 124 | El Arroyo | Un arroyo claro cruza el bosque. | Seguir el agua cuesta arriba. | Piedra del arroyo | "Ir contra la corriente a veces aclara." |
| 125 | El Honguito | Hongos luminosos en troncos caídos. | Encender hongos para iluminar un tramo oscuro. | Espora | "Lo pequeño ilumina lo grande." |
| 126 | El Ciervo de Luz | Un ciervo observa sin huir. | No perseguir; caminar paralelo hasta que se va. | Astilla | "No todo debe ser capturado." |
| 127 | La Raíz | Raíces que bloquean el paso forman un puzzle orgánico. | Reorganizar raíces como tangram suave. | Raíz trenzada | "Las raíces sostienen, no solo atan." |
| 128 | El Musgo | Musgo sube por las piedras. | Esperar (o volver en otra sesión) a que el musgo cree un puente. | Musgo en frasco | "Algunas cosas no se apuran." |
| 129 | El Claroscuro | Un claro con sol directo. | Descansar en el claro; energía visual de la chispa se estabiliza. | Manta de picnic | "Permitirte luz no es traición al dolor." |
| 130 | El Nido | Un nido vacío con una pluma. | Dejar una pluma de la chispa (opcional). | Pluma del nido | "Dar también es sanar." |
| 131 | La Piedra Mojada | Una piedra con musgo y nombre borrado. | Limpiar musgo con luz lenta. | Cepillo suave | "Recordar sin quedarte atascado." |
| 132 | El Hongo Gigante | Un hongo alto como arco. | Pasar debajo; sonido grave reconfortante. | Sombrero de hongo | "Refugios vienen en formas raras." |
| 133 | La Caída de Hojas | Hojas caen sin tristeza. | Caminar entre hojas que crujen (audio ASMR). | Hoja roja | "Soltar también es ciclo." |
| 134 | El Tronco Hueco | Un tronco hueco atraviesa un muro de piedra. | Entrar al tronco (túnel oscuro corto). | Corteza | "Los huecos también son paso." |
| 135 | La Regadera | Una regadera oxidada junto a un brote seco. | Regar; el brote crece en la sesión. | Regadera | "Cuidar algo te cuida a ti." |
| 136 | El Puente de Raíces | Raíces forman puente sobre un hoyo. | Cruzar cuando las raíces terminan de crecer (puzzle tiempo). | Cuerda de cáñamo | "La naturaleza construye despacio." |
| 137 | El Bosque Espejo | Un lago refleja el bosque más verde. | Tocar el lago: el reflejo se une al real. | Agua en frasco | "Puedes verse distinto." |
| 138 | La Semilla | La semilla del prólogo resuena en la mochila. | Plantar la semilla en tierra blanda. | Semilla plantada | "No sabes qué crecerá. Plántala igual." |
| 139 | El Crecimiento | Un brote visible donde plantaste. | Volver a regar; cinemática de crecimiento mínimo. | Brote | "Lo que cuidas permanece." |
| 140 | Las Luces que Se Mueven | Luces parpadean entre los árboles. No son estrellas. | Seguir las luces (transición al Cap. 8). | Brújula de musgo | "El bosque te devolvió al camino." |

---

## Capítulo 8 — Los Encuentros (Niveles 141–160)

### Historia completa del mundo

Las luces del bosque eran otras chispas — no copias de la tuya, otras personas-luz en su propio viaje. Algunas pasan de largo. Otras caminan un tramo contigo sin palabras: mecánicas cooperativas asíncronas (huellas de otros jugadores reales o NPCs fantasma). Los Encuentros exploran la conexión sin romanticizarla: no todo encuentro es amistad eterna; a veces alguien te acompaña una estación y se despide en la siguiente. La Chispa aprende que la luz de otro no apaga la suya ni la reemplaza — pueden iluminar el mismo camino un rato. Hay despedidas suaves, señales de "estoy aquí" en el mapa, y un nivel donde debes esperar a que otra chispa abra una puerta (enseñando interdependencia sin dependencia). En el nivel 160, las chispas se dispersan hacia el cielo nocturno. La tuya sigue sola otra vez — pero diferente.

**Metáfora emocional:** Conexión humana, comunidad, acompañamiento.  
**Mecánica distintiva:** Fantasmas de otros jugadores; caminar en paralelo; señales de luz predefinidas.  
**Paleta:** Múltiples tonos cálidos de luz, noche estrellada temprana.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 141 | La Primera Otra | Otra chispa azul cruza tu camino. No habla. | Caminar paralelos 30 seg; luego se separan. | Piedra azul | "No estás tan solo como crees." |
| 142 | Las Huellas Ajenas | Huellas de luz que no son tuyas. | Seguir huellas que a veces se desvían. | Huella ajena | "Otros caminaron aquí." |
| 143 | La Señal | Una chispa parpadea tres veces lejos. | Repetir el parpadeo (input simple). | Linterna de señales | "Puedes decir 'estoy aquí' sin palabras." |
| 144 | El Fogón | Varias chispas alrededor de un fuego compartido (NPCs). | Acercarse al fuego; escuchar respiraciones. | Palo para el fuego | "Compartir calor no quita la tuya." |
| 145 | El Camino Doble | Un cruce donde otra chispa eligió otro rumbo. | Elegir tu rumbo; ambos válidos. | Bifurcación | "Caminar juntos no es caminar igual." |
| 146 | La Ayuda | Una puerta pesada solo se abre con dos luces. | Esperar a NPC o segunda luz del jugador (simulada). | Llave compartida | "A veces necesitas a alguien." |
| 147 | El Regalo | Otra chispa deja un recuerdo en el suelo para ti. | Recoger regalo; opción de dejar uno después. | Cinta de regalo | "Recibir también es difícil." |
| 148 | La Despedida | La chispa azul se detiene y se apaga un momento. Luego sigue. | Quedarse quieto mientras pasa la despedida. | Pañuelo de luz | "No todo encuentro es para siempre." |
| 149 | El Puente de Luces | Varias chispas iluminan un puente largo. | Activar tu segmento del puente (cooperativo). | Tablón marcado | "Tu parte sostiene el conjunto." |
| 150 | La Historia | Fantasmas muestran fragmentos de sus viajes (sin palabras). | Observar 3 fantasmas; cada uno un gesto de capítulo pasado. | Libreta ajena | "Cada luz lleva su tormenta." |
| 151 | El Mercado de Intercambio | Un lugar donde se dejan cosméticos simbólicos. | Dejar bufanda; tomar otra (intercambio UI simple). | Bufanda tejida | "Compartir lo que tienes multiplica." |
| 152 | La Canción | Varias chispas crean una melodía al pasar por notas. | Caminar por notas en el suelo en orden. | Nota musical | "Juntos hacen música sin hablar." |
| 153 | El Niño de Luz | Una chispa pequeña sigue a la tuya. | Llevar al niño un tramo; luego vuelve con otra. | Cometa de luz | "Cuidar a otro te recuerda cuidarte." |
| 154 | El Anciano | Una chispa lenta, casi apagada, sigue avanzando. | Caminar al ritmo del anciano (lento). | Bastón de luz | "El ritmo lento también llega." |
| 155 | La Disculga | Dos chispas se cruzan y una retrocede para dejar paso. | Esperar en un estrecho para que pase otra. | Señal de mano | "Ceder espacio es conexión." |
| 156 | El Mensaje | En un muro, mensajes de jugadores reales (moderados). | Leer mensajes; opción de dejar uno predefinido amable. | Tiza | "Tus palabras pueden sostener a otro." |
| 157 | La Estación Otra Vez | Una estación donde chispas suben y bajan. | Esperar un tren de luz (cinemática). | Boleto compartido | "A veces el camino es compartido un rato." |
| 158 | El Abrazo | Dos chispas se rozan y la luz se duplica un instante. | Tocar otra chispa (NPC) en un círculo. | Pulso doble | "El contacto no te apaga." |
| 159 | La Dispersión | Las chispas comienzan a irse hacia el cielo. | Despedirse de cada una (tocar). | Estrella fugaz | "Dejar ir también es amor." |
| 160 | Solo Otra Vez | Quedas sola. Pero la luz es más estable. | Caminar hacia cielo estrellado (transición Cap. 9). | Luz estable | "Llevas a otros contigo." |

---

## Capítulo 9 — Las Estrellas (Niveles 161–180)

### Historia completa del mundo

El cielo nocturno es el territorio de la aceptación. Las Estrellas no son premios: son versiones anteriores de ti que ya no brillan igual pero siguen siendo parte del cielo. La Chispa recorre una llanura bajo constelaciones que, al acercarse, muestran momentos del viaje — no para nostalgia triste, sino para integración. "Ya no eres quien eras" no es pérdida: es evidencia de que atravesaste algo. Algunas estrellas están apagadas (días que casi no saliste de la cama); otras brillan fuerte (días que caminaste bajo tormenta). Todas cuentan. El capítulo invita a mirar atrás sin quedarse: caminar bajo el cielo mientras las estrellas se reordenan en una constelación nueva — la tuya. En el nivel 180, la chispa llega al borde del mundo. No hay precipicio: hay un horizonte que se aclara. Mañana.

**Metáfora emocional:** Aceptación, identidad cambiada, mirar el viaje completo.  
**Mecánica distintiva:** Constelaciones como árbol de habilidades emocional; recapitulación interactiva; cielo que responde a recuerdos coleccionados.  
**Paleta:** Índigo profundo, estrellas blancas y doradas, chispa madura.

### Niveles

| Niv. | Nombre | Historia | Mecánica | Recuerdo | Frase |
|------|--------|----------|----------|----------|-------|
| 161 | El Cielo Abierto | Por primera vez el cielo es claro de noche. | Caminar bajo estrellas que parpadean suave. | Estrella capturada | "Ya no eres quien eras." |
| 162 | La Constelación Niebla | Una constelación evoca el Cap. 1. | Conectar puntos de luz para formar la forma. | Punto de niebla | "La confusión fue un capítulo, no tu nombre." |
| 163 | La Lluvia en el Cielo | Estrellas que parecen gotas congeladas. | Puzzle de estrellas que "caen" lento. | Gota estelar | "La tristeza también pasó." |
| 164 | El Ruido Lejano | Un trueno lejano sin amenaza. | Caminar mientras el eco del ruido se desvanece. | Onda | "El ruido ya no te alcanza igual." |
| 165 | La Estrella Solitaria | Una estrella aparte del grupo. | Ir hacia ella; brilla al llegar. | Estrella sola | "Tu ritmo puede ser distinto." |
| 166 | La Tormenta Recordada | Relámpagos en el horizonte, no encima. | Observar tormenta lejana sin atravesarla. | Relámpago en frasco | "Sobreviviste eso." |
| 167 | El Amanecer en el Cielo | Una estrella que parece sol naciente. | Tocarla al amanecer (ciclo día/noche en el nivel). | Sol miniatura | "Las mañanas siguen existiendo." |
| 168 | El Bosque Arriba | Constelación en forma de árbol. | Hacer crecer un árbol de luz con recuerdos ya coleccionados. | Hoja estelar | "Creciste." |
| 169 | Las Chispas Lejanas | Estrellas que parpadean como otras chispas. | Enviar señales; algunas responden. | Señal luminosa | "Sigues conectada." |
| 170 | La Estrella Apagada | Una estrella que no brilla. | Sentarse junto a ella un momento. | Ceniza fría | "Algunos días no brillaste. Sigues aquí." |
| 171 | El Nombre Propio | Por primera vez puedes nombrar tu chispa (opcional, cosmético). | UI simple de nombre o dejar en blanco. | Placa en blanco | "Tú eliges quién eres hoy." |
| 172 | El Álbum | Un cielo-museo de todos los recuerdos del juego. | Recorrer constelaciones por capítulo. | Álbum estelar | "Tu historia es larga." |
| 173 | La Estrella Nueva | Una estrella aparece donde no estaba antes. | Colocar tu estrella en el cielo (drag suave). | Estrella nueva | "Puedes hacer espacio para quien eres ahora." |
| 174 | El Perdón | Una estrella representa algo que no perdonaste. | Tocar y dejar que se desvanezca suave (no obligatorio). | Agua bendita simbólica | "Soltar no es olvidar." |
| 175 | La Gratitud | Tres estrellas para tres momentos de gratitud (elegir de lista). | Elegir tres recuerdos favoritos del jugador. | Lista de luz | "Agradecer es mirar de frente." |
| 176 | El Horizonte | El suelo y el cielo casi se tocan lejos. | Caminar hacia el horizonte sin llegar (Zeno suave). | Línea del horizonte | "Mañana siempre está lejos hasta que llega." |
| 177 | La Última Noche | La noche más larga del viaje. | Caminar en oscuridad con estrellas como única guía. | Luna tenue | "Esta noche también termina." |
| 178 | El Primer Alba | El cielo empieza a aclarar antes del final. | Caminar mientras las estrellas se van despidiendo. | Rayo de alba | "Lo lograste." |
| 179 | El Borde | Llegas al borde del mundo. No hay miedo. | Contemplación larga; música sube. | Borde suave | "Llegaste más lejos de lo que creías." |
| 180 | Mañana Otra Vez | El horizonte es oro pálido. | Caminar los últimos pasos (cinemática). | Semilla de mañana | "Llegaste a mañana." |

---

## Capítulo Final — Mañana (Epílogo jugable)

### Historia completa

No hay fanfarria. La Chispa está en un campo vacío al amanecer. No "ganó" la depresión — no es ese juego. Llegó a mañana. Otra vez. El epílogo es corto (5–10 min): caminar por un campo que mezcla ecos de todos los mundos — un árbol del bosque, una banca de la lluvia, una estrella aún visible. Al final, la pantalla no dice "The End". Dice:

> **"Lo lograste. Llegaste a mañana."**

Luego:

> **"¿Un día más?"**

Si el jugador acepta, comienza un **Nuevo Ciclo+**: los mismos mundos con variaciones sutiles (flores distintas, mensajes nuevos de la comunidad Enjoy, estaciones alternativas). La narrativa no se resetea en lore: la chispa "vuelve a caminar" porque eso es lo que hacen las personas.

### Niveles del epílogo

| Niv. | Nombre | Historia | Mecánica |
|------|--------|----------|----------|
| E1 | El Campo de Todos | Ecos visuales de los 9 capítulos en un solo paisaje. | Caminar libremente; encontrar 9 recuerdos opcionales. |
| E2 | La Semilla Crecida | El brote del Cap. 7 es ahora un árbol pequeño. | Sentarse bajo el árbol; créditos suaves empiezan. |
| E3 | Un Día Más | La pregunta final. | Elegir "Descansar" (salir) o "Un día más" (nuevo ciclo+). |

---

# 11. Sistema de Recuerdos

Cada recuerdo es un **artefacto emocional**: objeto 3D/2D coleccionable con lore de 2–3 líneas, ilustración en galería y frase asociada.

## Categorías

| Tipo | Función | Ejemplo |
|------|---------|---------|
| Objeto cotidiano | Ancla emocional universal | Taza, bufanda |
| Fragmento | Pieza de historia del mundo | Nota, foto rota |
| Semilla / Planta | Progresión entre capítulos | Semilla de luz, brote |
| Luz ajena | Conexión con otros | Piedra azul, boleto compartido |
| Estrella | Cierre de arco | Estrella nueva, constelación |

## Datos por recuerdo (modelo para Supabase)

```json
{
  "id": "memory_ch1_l04_note",
  "chapter": 1,
  "level": 4,
  "name": "Nota a medio escribir",
  "lore": "Alguien empezó a escribir y no pudo terminar. No importa. El gesto quedó.",
  "phrase_id": "phrase_ch1_l04",
  "art_asset": "memories/note_half.png",
  "rarity": "common"
}
```

## Galería

- Vista por capítulo o cronológica.
- Al tocar un recuerdo: zoom del objeto + lore + frase + opción "Compartir" (imagen para redes con marca Enjoy).

---

# 12. Sistema de Frases

Las frases son el puente directo con el contenido Enjoy en redes.

## Reglas de escritura

- Segunda persona o primera plural suave ("puedes", "a veces").
- Sin imperativos agresivos ("¡Ánimo!").
- Sin promesas de curación.
- Máximo 12 palabras por frase en pantalla.
- Aparecen tras el recuerdo, nunca antes (el jugador las gana).

## Banco ampliado (selección)

- No necesitas resolver toda tu vida hoy.
- Sobrevivir también cuenta.
- Un paso sigue siendo un paso.
- Descansar no es rendirse.
- Has llegado más lejos de lo que crees.
- Llega vivo al siguiente capítulo.
- Tu ritmo es válido.
- Pedir ayuda es humano.
- Está bien ser solo suficiente.
- Mañana puede ser más suave.

## Compartir en redes

Plantilla automática: fondo del nivel + frase + logo Enjoy + QR/deep link al nivel.

---

# 13. Personalización

Desbloqueables:

- Bufandas
- Capas
- Mochilas
- Colores
- Efectos visuales

Todo debe poder conseguirse jugando.

---

# 14. Música y Audio

## Por capítulo

| Capítulo | Instrumentación | Sensación |
|----------|-----------------|-----------|
| Prólogo | Piano solo, silencios | Nacimiento |
| La Niebla | Piano + pads etéreos | Suspenso suave |
| La Lluvia | Piano + lluvia rítmica + lo-fi | Melancolía |
| El Ruido | Capas que se pueden mutear al respirar | Sobrecarga |
| La Soledad | Guitarra acústica mínima | Vacío cálido |
| La Tormenta | Cuerdas graves + percusión lejana | Tensión |
| El Amanecer | Piano + cuerdas ascendentes | Alivio |
| El Bosque | Flauta + ambiente forestal | Paciencia |
| Los Encuentros | Múltiples motivos que se armonizan | Comunidad |
| Las Estrellas | Piano + synth celestial | Integración |
| Mañana | Tema principal completo, despacio | Cierre |

## Audio interactivo

- Al **respirar**: filtro low-pass, volumen ambiente -30%.
- Al **encontrar recuerdo**: una nota nueva en la melodía del capítulo (permanente).
- Sin jumpscares sonoros nunca.

---

# 15. Monetización

Modelo:
Free to Play.

Permitido:

- Cosméticos
- Música adicional
- Climas especiales
- Donaciones
- Premium opcional

No permitido:

- Energía
- Pay to Win
- Lootboxes

---

# 16. Tecnología

Frontend:
Flutter

Motor:
Flame Engine

Estado:
Riverpod

Backend:
Supabase

Analytics:
Firebase Analytics

Crash Reporting:
Firebase Crashlytics

Push Notifications:
Firebase Messaging

Ads:
Google AdMob

---

# 17. Arquitectura

lib/

core/

features/

game/

audio/

memories/

levels/

inventory/

achievements/

ui/

services/

---

# 18. MVP — Primera versión jugable

## Alcance cerrado

| Incluido | Excluido (post-MVP) |
|----------|---------------------|
| Prólogo (P1–P3) | Capítulos 2–9 |
| Capítulo 1 completo (20 niveles) | Monetización |
| Movimiento + respirar + interactuar | Multijugador real |
| Sistema de recuerdos y frases | Cuenta Enjoy / nube |
| Guardado local (Hive/SharedPreferences) | Push notifications |
| 1 tema musical + variaciones | Ads |
| Mapa de capítulos (solo Niebla desbloqueado) | Ciclo+ |

## Criterio de éxito del MVP

- 5 testers completan Cap. 1 sin frustración técnica.
- Al menos 3 reportan sensación alineada con videos Enjoy.
- Sesión media 8–15 minutos.
- Frase más compartida del Cap. 1 identificada para primer video cruzado.

## Orden de implementación sugerido

1. Prototipo movimiento chispa (Flame)
2. Nivel P1 sin UI
3. Mecánica respirar
4. Sistema recuerdo + frase
5. Niveles 1–5 (validar loop)
6. Niveles 6–20 + transición
7. Galería recuerdos + mapa
8. Audio + pulido

---

# 19. Roadmap de Desarrollo

| Fase | Entregable | Duración estimada |
|------|------------|-------------------|
| **1 — MVP** | Prólogo + Cap. 1 (23 niveles), guardado local | 8–10 semanas |
| **2 — Mundos 2–3** | Lluvia + Ruido (40 niveles), audio por capítulo | 6–8 semanas |
| **3 — Mundos 4–6** | Soledad, Tormenta, Amanecer | 8–10 semanas |
| **4 — Mundos 7–9 + Final** | Bosque, Encuentros, Estrellas, epílogo | 8–10 semanas |
| **5 — Enjoy** | Deep links, compartir, cuenta opcional | 4 semanas |
| **6 — Monetización** | Cosméticos, premium, sin pay-to-win | 4 semanas |
| **7 — Eventos** | Frase del día, códigos de videos Enjoy | Continuo |

---

# 20. Integración con Redes

Cada capítulo puede generar:

- Videos
- Shorts
- Reels
- TikToks

Ejemplo:

Frase del juego:
"Sobrevivir también cuenta."

Video Enjoy relacionado.

El contenido alimenta al juego.

El juego alimenta al contenido.

---

# 21. Experiencia Móvil

## Principios de sesión

- Sesiones de 3 a 12 minutos por nivel.
- Pausa automática al minimizar la app.
- Sin temporizadores de presión.
- Progreso guardado al completar cada recuerdo.
- Reanudar exactamente donde el jugador dejó la chispa.

## Controles

| Gesto | Acción |
|-------|--------|
| Deslizar / joystick virtual | Caminar |
| Tocar objeto brillante | Interactuar / recoger recuerdo |
| Mantener presionado | Respirar (ralentiza el mundo, calma audio) |
| Pellizcar | Zoom suave en paisajes |
| Doble toque | Salto pequeño (solo donde el nivel lo permita) |

## Pantallas principales

1. **Inicio** — "Continuar el camino" / "Empezar de nuevo"
2. **Mapa de capítulos** — Mundos como constelaciones apagadas que se iluminan
3. **Nivel** — Gameplay contemplativo
4. **Recuerdos** — Galería emocional (arte + frase + lore)
5. **Ajustes** — Música, vibración suave, alto contraste, idioma
6. **Enjoy** — Puente al ecosistema (videos, comunidad, app principal)

## Accesibilidad y seguridad emocional

- Modo sin parpadeos.
- Subtítulos para frases.
- Botón **Descansar** siempre visible (sale sin perder progreso del nivel).
- Recursos de crisis por país en Ajustes (enlace discreto).
- Notificación opcional máxima: "Tu luz sigue aquí."

---

# 22. Integración Ecosistema Enjoy

## Flujo bidireccional

```
Video Enjoy → frase/tema → Nivel o recuerdo en el juego
Juego → frase + captura → Compartir → Redes → Enjoy
```

## Kit de contenido por capítulo (para redes)

| Capítulo | Hook para video | Hashtag sugerido |
|----------|-----------------|------------------|
| La Niebla | "Cuando no sabes qué te pasa" | #UnDíaMás #LaNiebla |
| La Lluvia | "Días grises también cuentan" | #LaLluvia #EnjoyJourney |
| El Ruido | "Tu mente no tiene que escuchar todo" | #ElRuido |
| La Soledad | "Estar solo no es estar perdido" | #LaSoledad |
| La Tormenta | "Sigue. Solo sigue." | #LaTormenta |
| El Amanecer | "Las noches terminan" | #ElAmanecer |
| El Bosque | "Sanar lleva tiempo" | #ElBosque |
| Los Encuentros | "No estás tan solo" | #LosEncuentros |
| Las Estrellas | "Ya no eres quien eras" | #LasEstrellas |

## Deep links

`enjoyjourney://capitulo/{id}/nivel/{id}` — abrir desde descripción de TikTok/Reels.

---

# 23. Dirección de Arte

- **Estilo:** 2.5D, siluetas suaves, sin rostros humanos detallados.
- **La Chispa (La Luz):** círculo/orgánico luminoso dibujado por código (sin sprite en MVP).
- **Sin UI intrusiva:** HUD mínimo; mapa y galería fuera del gameplay.
- **Referentes:** Journey, Gris, Alto's Odyssey — paleta emocional por capítulo.
- **Congruencia entre niveles:** mismo sistema de capas (fondo → atmósfera → gameplay → luz → UI).

## La Chispa — Especificación visual (código)

Implementada en `ChispaComponent` sin assets externos.

| Capa | Descripción | Color |
|------|-------------|-------|
| Halo exterior | Círculo grande, blur, pulso lento | `#FFD89B` @ 8–15% opacidad |
| Corona | Anillo medio, respiración | `#FFB347` @ 25% |
| Núcleo | Círculo sólido cálido | `#FFF4D6` centro → `#FF9A5C` borde |
| Chispas orbitales | 4–6 partículas pequeñas | `#FFE8B0` |
| Estela al moverse | Partículas que se desvanecen | `#FFD89B` @ decreciente |
| Respirar (activo) | Escala 1.0→1.15, halo más amplio | Intensidad +30% |

**Animación constante:** respiración sinusoidal ~4 s por ciclo.  
**Al estar quieta:** pulso suave. **Al moverse:** estela + núcleo ligeramente alargado en dirección del movimiento.

## Sistema de diseño por nivel (congruencia)

Todos los niveles comparten la misma estructura Flame:

```
DarknessBackground  → color base del capítulo
AtmosphereLayer     → niebla, lluvia, partículas (según mundo)
LevelGeometry       → suelo, obstáculos, senderos
Interactables       → motas, recuerdos, faros
ChispaComponent     → jugador (siempre igual)
FogOfWar / LightMask → visibilidad según capítulo
HudOverlay          → frase, botón Descansar (Flutter stack)
```

Paleta base por capítulo definida en `WorldTheme` (ver `lib/core/theme/world_themes.dart`).

---

# 24. Modelo de Datos de Nivel

```dart
class LevelDefinition {
  final String id;
  final int chapter;
  final int levelNumber;
  final String name;
  final String story;
  final String mechanic;
  final String? memoryId;
  final String? phrase;
  final String backgroundAsset;
  final String musicTrack;
  final Duration targetDuration;
}
```

Los 183 niveles (P1–P3 + 1–180 + E1–E3) se cargan desde JSON local en MVP; Supabase en producción.

---

# 25. Métricas de Éxito

No buscamos sesiones de 8 horas.

Buscamos:

- Retención emocional.
- Retorno diario.
- Comunidad.
- Compartidos.
- Guardados.

---

# 26. Visión a Largo Plazo

Enjoy Journey es el primer producto.

Posteriormente:

- Aplicación principal Enjoy.
- Comunidad.
- Podcasts.
- Herramientas emocionales.
- Ecosistema completo.

---

# 27. Manifiesto Enjoy ↔ Juego

Este manifiesto alinea Enjoy Journey con el ecosistema Enjoy (videos, comunidad, app futura). Debe reflejarse en la descripción de la tienda, la web, los shorts y cualquier comunicación pública.

## Qué somos

- Un **compañero interactivo** para momentos difíciles, aburridos o vacíos.
- Una extensión del mensaje Enjoy: **sigue adelante, llega a mañana**.
- Un espacio de **calma, reflexión y progreso suave** — sin prisa, sin castigo.
- Una **puerta** al resto del ecosistema Enjoy, no un producto aislado.

## Qué NO somos

- **No somos terapia.** No diagnosticamos, no tratamos, no sustituimos a un profesional de salud mental.
- **No somos una app médica.** No prometemos curar depresión, ansiedad, estrés ni ningún trastorno.
- **No somos autoayuda tóxica.** No vendemos felicidad instantánea, éxito ni "solo piensa positivo".
- **No somos un juego adictivo.** No usamos presión, energía, FOMO ni mecánicas que castiguen por no jugar.
- **No somos un reemplazo de ayuda humana.** Animamos a buscar apoyo real cuando hace falta.

## Lo que sí prometemos al jugador

| Promesa | En la práctica |
|---------|----------------|
| Puedes avanzar a tu ritmo | Sin timers, sin Game Over punitivo |
| Puedes descansar | Botón Descansar siempre visible |
| Puedes sentirte acompañado | Frases, recuerdos, comunidad Enjoy |
| Puedes volver mañana | Guardado automático, mensaje "un día más" |
| Puedes pedir ayuda | Recursos de crisis en Ajustes (enlaces reales por país) |

## Posicionamiento frente a depresión, ansiedad y estrés

El juego **no nombra** estas experiencias en pantalla. Las **representa** a través de mundos metafóricos:

| Experiencia humana | Mundo en el juego | Mensaje Enjoy |
|--------------------|-------------------|---------------|
| No saber qué te pasa | La Niebla | Avanzar sin entenderlo todo |
| Tristeza persistente | La Lluvia | Seguir aunque llueva |
| Mente acelerada, sobrecarga | El Ruido | No todo merece tu atención |
| Aislamiento | La Soledad | Estar solo no es estar perdido |
| Momento de crisis | La Tormenta | Sigue. Solo sigue. |
| Agotamiento post-crisis | El Amanecer | Las noches terminan |
| Sanación lenta | El Bosque | Sanar también es crecer |
| Necesidad de conexión | Los Encuentros | No estás tan solo |
| Cambio de identidad | Las Estrellas | Ya no eres quien eras — y está bien |

**Impacto esperado (realista):** ritual de calma, sensación de progreso, frases que acompañan, comunidad. **No** reducción clínica de síntomas medible sin estudios formales.

## Guía de tono — Frases que SÍ / NO

### Sí (alineado Enjoy)

- "Un paso sigue siendo un paso."
- "Descansar no es rendirse."
- "Sobrevivir también cuenta."
- "No necesitas tenerlo todo claro."
- "Mañana puede ser más suave."
- "Tu ritmo es válido."
- "Pedir ayuda es humano."

### No (evitar siempre)

- "¡Ánimo!" / "¡Tú puedes!" (presión positiva)
- "Todo pasa por algo." (minimiza el dolor)
- "Solo son pensamientos." (invalida la experiencia)
- "Otros están peor." (comparación)
- "La felicidad es una elección." (culpa al jugador)
- "Si no mejoras, no lo intentaste." (castigo)
- Cualquier promesa de curación o resultado garantizado

### Reglas de escritura

1. Segunda persona suave o primera persona ("puedes", "a veces", "todavía").
2. Máximo 12 palabras en pantalla.
3. Sin imperativos agresivos; preferir invitación ("puedes quedarte un momento").
4. Reconocer la dificultad antes de ofrecer alivio.
5. Cerrar con apertura, no con solución ("llega a mañana", no "todo estará bien").

## Texto sugerido — Descripción de tienda (borrador)

> Enjoy Journey es un juego contemplativo sobre seguir adelante. Camina como una pequeña luz a través de mundos de niebla, lluvia y tormenta — metáforas de momentos que muchos conocen. Sin violencia, sin prisa, sin castigo.  
> No es terapia. Es compañía. Un lugar para respirar, reflexionar y llegar a mañana.  
> Aliado del ecosistema Enjoy.

## Disclaimer legal (obligatorio en app)

> Enjoy Journey es una experiencia de entretenimiento y bienestar emocional general. No sustituye diagnóstico, tratamiento ni atención profesional de salud mental. Si estás en crisis, contacta a los recursos de emergencia de tu país (enlaces en Ajustes).

---

# 28. Modo Contemplación

Modo diseñado para sesiones largas **sin presión de progreso**: volver a un mundo ya completado solo para caminar, escuchar y estar.

## Por qué existe

- El loop principal está optimizado para **3–12 minutos** por nivel.
- Parte del público Enjoy querrá **quedarse** en un paisaje que ya conoce — como reescuchar un video o una playlist.
- Permite horas de uso saludable sin grind ni adicción: **no hay recompensas exclusivas** por tiempo en contemplación.

## Cuándo se desbloquea

- **MVP:** no incluido (post-MVP, Fase 2).
- **Producción:** al completar un capítulo entero, ese mundo aparece en el mapa con icono de **contemplación** (luna o círculo abierto).

## Comportamiento

| Aspecto | Modo historia (normal) | Modo contemplación |
|---------|------------------------|---------------------|
| Objetivos | Recuerdos, frases, salida | Ninguno obligatorio |
| Puzzles | Activos hasta completar | Desactivados o ya resueltos |
| UI | Mínima | Solo botón Salir y Respirar |
| Música | Por capítulo | Playlist del capítulo en loop |
| Progreso | Guarda avance | No afecta guardado de historia |
| Duración | 3–12 min típico | Libre (5 min – 2 h) |
| Recompensas | Recuerdos, frases | Ninguna nueva (solo calma) |

## Flujo de usuario

1. Mapa de capítulos → tocar mundo completado → **"Contemplar"** (además de "Rejugar historia").
2. Elegir sub-zona o nivel favorito (lista o mapa simplificado del capítulo).
3. Aparece la chispa en el punto de entrada del paisaje.
4. Caminar y respirar sin indicadores de objetivo.
5. Al salir: mensaje opcional suave — *"Gracias por quedarte un rato."* (sin streak, sin culpa).

## Variantes futuras (Fase 4+)

- **Contemplación guiada:** audio de respiración Enjoy sincronizado con la mecánica de respirar.
- **Clima contemplativo:** lluvia suave, nieve, atardecer (cosmético desbloqueado o premium).
- **Frase flotante opcional:** una frase del capítulo cada X minutos, dismissible.
- **Sincronización con contenido:** un Reel Enjoy del día abre directamente el mundo contemplativo relacionado.

## Métricas (sin gamificar)

- Tiempo en contemplación (agregado, anónimo).
- Mundos más contemplados (para saber qué atmósferas resonan).
- **No** usar estas métricas para presionar al jugador a volver.

---

# 29. Checklist Pre-Desarrollo

Marcar antes o durante el MVP. Los ítems críticos bloquean publicación; los recomendados pueden paralelizarse con el código.

## A. Identidad y marca

| # | Ítem | Estado | Responsable | Notas |
|---|------|--------|-------------|-------|
| A1 | Nombre final de la app | ☑ **Un Día Más** (EN: One More Day) | Enjoy | Identidad: La Luz / La Chispa |
| A2 | Logo y icono de app (mín. 1024×1024) | ☐ Pendiente | Diseño | Chispa reconocible en tamaño pequeño |
| A3 | Paleta oficial por capítulo (hex) | ☐ Parcial | Diseño | Doc tiene dirección; falta fijar valores |
| A4 | 3–5 mockups o referencias visuales (Chispa + La Niebla) | ☑ Parcial | Código | `ChispaComponent` — diseño procedural en MVP |

## B. Contenido Enjoy

| # | Ítem | Estado | Responsable | Notas |
|---|------|--------|-------------|-------|
| B1 | Manifiesto aprobado por equipo Enjoy | ☐ En doc | Producto | Sección 27 — revisar y firmar |
| B2 | Lista de frases prohibidas / aprobadas | ☐ En doc | Contenido | Sección 27 — ampliar si hace falta |
| B3 | Primer video cruzado (Cap. 1 + frase del juego) | ☐ Pendiente | Redes | Para lanzamiento MVP |
| B4 | Hashtags y copy por capítulo | ☐ Parcial | Redes | Tabla en sección 22 |
| B5 | URL / esquema deep link definitivo | ☐ Pendiente | Dev | `enjoyjourney://` o dominio web |

## C. Salud y legal

| # | Ítem | Estado | Responsable | Notas |
|---|------|--------|-------------|-------|
| C1 | Disclaimer en app (texto legal) | ☐ En doc | Legal | Sección 27 — revisar por jurisdicción |
| C2 | Recursos de crisis — **Colombia (v1)** | ☑ Definido | Producto | Línea 106, Línea 123. Ampliar países en fases posteriores. |
| C3 | Política de privacidad (GDPR, menores si aplica) | ☐ Pendiente | Legal | Antes de publicar en store |
| C4 | Clasificación de edad en stores | ☐ Pendiente | Producto | Esperable: 4+ / Everyone |

## D. Validación emocional

| # | Ítem | Estado | Responsable | Notas |
|---|------|--------|-------------|-------|
| D1 | Criterios de éxito emocional del MVP (escrito) | ☐ Parcial | Producto | Ver sección 18 |
| D2 | 5–10 testers del público Enjoy | ☐ Pendiente | Comunidad | No solo gamers |
| D3 | Cuestionario post-sesión (3 preguntas max) | ☐ Pendiente | Producto | Ej: ¿Te sentiste en calma? ¿Frustrado? ¿Compartirías una frase? |
| D4 | Iteración si >2 testers reportan ansiedad o frustración en un nivel | ☐ Proceso | Dev + Contenido | Ajustar dificultad o audio |

## E. Técnico (MVP)

| # | Ítem | Estado | Responsable | Notas |
|---|------|--------|-------------|-------|
| E1 | Repo Flutter + Flame inicializado | ☑ En progreso | Dev | Carpeta `un_dia_mas/` |
| E2 | JSON niveles P1–P3 + 1–20 exportado del doc | ☐ Pendiente | Dev | Modelo sección 24 |
| E3 | Guardado local (progreso, recuerdos) | ☐ Pendiente | Dev | |
| E4 | Audio: 1 tema + SFX respirar + recuerdo | ☐ Pendiente | Audio | |
| E5 | Build Android (APK prueba) | ☐ Pendiente | Dev | |
| E6 | Build iOS (TestFlight) | ☐ Pendiente | Dev | Si aplica |

## F. Post-MVP (no bloquean inicio)

| # | Ítem | Cuándo |
|---|------|--------|
| F1 | Modo contemplación | Fase 2 |
| F2 | Cuenta Enjoy / nube | Fase 5 |
| F3 | Monetización cosmética | Fase 6 |
| F4 | Mensajes de comunidad en muros (Cap. 8) | Fase 4 + moderación |

## Definición de "listo para codificar MVP"

Se considera **listo** cuando estén marcados al menos:

- **A1** (nombre provisional aceptable aunque no final)
- **A4** (referencias visuales mínimas)
- **B1–B2** (manifiesto y tono en doc — hecho)
- **C2** (al menos 2 países con enlaces de crisis)
- **D1** (criterios escritos)
- **E1** (repo creado — siguiente paso dev)

---

# Frase Final

No importa qué tan lento avances.

Lo importante es que sigas caminando.

Y si hoy no puedes llegar al final...

Llega a mañana.
