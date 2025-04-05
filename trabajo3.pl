:- dynamic respuesta/2.

% Base de conocimientos de carreras y sus características
carrera(ingenieria_sistemas, [
    'Ingeniería de Sistemas',
    'Diseño y desarrollo de software, redes y sistemas informáticos',
    'Alta demanda laboral, buenos salarios, oportunidades globales'
]).

carrera(medicina, [
    'Medicina',
    'Diagnóstico y tratamiento de enfermedades, cuidado de pacientes',
    'Gran impacto social, prestigio, variedad de especializaciones'
]).

carrera(derecho, [
    'Derecho',
    'Aplicación de leyes, defensa legal, asesoría jurídica',
    'Diversas áreas de práctica, posibilidad de influir en políticas'
]).

carrera(arquitectura, [
    'Arquitectura',
    'Diseño de edificios y espacios, planificación urbana',
    'Combinación de arte y técnica, impacto visible en el entorno'
]).

carrera(psicologia, [
    'Psicología',
    'Estudio de la mente y comportamiento, terapia psicológica',
    'Ayuda a personas, diversas aplicaciones (clínica, organizacional, educativa)'
]).

carrera(administracion_empresas, [
    'Administración de Empresas',
    'Gestión organizacional, dirección de empresas',
    'Amplio campo laboral, oportunidades de liderazgo'
]).

carrera(ingenieria_civil, [
    'Ingeniería Civil',
    'Diseño y construcción de infraestructuras (puentes, carreteras, edificios)',
    'Trabajo en grandes proyectos, impacto en desarrollo urbano'
]).

carrera(ingenieria_industrial, [
    'Ingeniería Industrial',
    'Optimización de procesos y sistemas productivos',
    'Versatilidad laboral, aplicable a múltiples industrias'
]).

carrera(economia, [
    'Economía',
    'Análisis de sistemas económicos, políticas financieras',
    'Influencia en decisiones empresariales y gubernamentales'
]).

carrera(contabilidad, [
    'Contabilidad',
    'Gestión financiera, auditoría, impuestos',
    'Estabilidad laboral, necesario en todas las organizaciones'
]).

carrera(diseno_grafico, [
    'Diseño Gráfico',
    'Creación visual para comunicación y marketing',
    'Creatividad aplicada, demanda en industria digital'
]).

carrera(marketing, [
    'Marketing',
    'Estrategias de mercado, branding, publicidad',
    'Dinámico, combinación de creatividad y análisis'
]).

carrera(biologia, [
    'Biología',
    'Estudio de seres vivos, investigación científica',
    'Contribución a avances médicos y ambientales'
]).

carrera(fisica, [
    'Física',
    'Investigación de leyes del universo, desarrollo tecnológico',
    'Base para innovaciones, trabajo en investigación'
]).

carrera(quimica, [
    'Química',
    'Estudio de sustancias, reacciones y propiedades',
    'Aplicaciones en industria, farmacia, medio ambiente'
]).

carrera(educacion, [
    'Educación',
    'Formación académica en diversas áreas',
    'Impacto en sociedad, diversidad de especializaciones'
]).

carrera(turismo, [
    'Turismo',
    'Gestión de servicios y destinos turísticos',
    'Oportunidad de viajes, industria en crecimiento'
]).

carrera(relaciones_internacionales, [
    'Relaciones Internacionales',
    'Diplomacia, comercio exterior, política global',
    'Trabajo multicultural, oportunidades internacionales'
]).

% Reglas de recomendación
recomendar_carrera(Carrera) :-
    cumple_requisitos(Carrera),
    carrera(Carrera, [Nombre, Desc, Ventajas]),
    format('~n=== RECOMENDACIÓN ===~n~nCarrera: ~w~nDescripción: ~w~nVentajas: ~w~n~n', [Nombre, Desc, Ventajas]).

% Reglas para cada carrera
cumple_requisitos(ingenieria_sistemas) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(resolucion_problemas),
    tiene_interes(tecnologia),
    tiene_personalidad(analitico).

cumple_requisitos(ingenieria_industrial) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(liderazgo),
    tiene_interes(tecnologia),
    tiene_personalidad(organizado).

cumple_requisitos(medicina) :-
    tiene_interes(salud),
    tiene_habilidad(biologia),
    tiene_personalidad(empatico),
    tiene_preferencia_laboral(interaccion_social).

cumple_requisitos(psicologia) :-
    tiene_interes(salud_mental),
    tiene_habilidad(empatia),
    tiene_personalidad(comunicativo),
    tiene_preferencia_laboral(interaccion_social).

cumple_requisitos(derecho) :-
    tiene_habilidad(argumentacion),
    tiene_interes(justicia),
    tiene_personalidad(persuasivo),
    tiene_preferencia_laboral(autonomia).

cumple_requisitos(arquitectura) :-
    tiene_habilidad(creatividad),
    tiene_interes(diseño),
    tiene_habilidad(visualizacion_espacial),
    tiene_personalidad(innovador).

cumple_requisitos(diseno_grafico) :-
    tiene_habilidad(creatividad),
    tiene_interes(diseño),
    tiene_habilidad(artistico),
    tiene_personalidad(innovador).

cumple_requisitos(administracion_empresas) :-
    tiene_habilidad(liderazgo),
    tiene_interes(negocios),
    tiene_personalidad(extrovertido),
    tiene_preferencia_laboral(trabajo_equipo).

cumple_requisitos(marketing) :-
    tiene_habilidad(creatividad),
    tiene_interes(negocios),
    tiene_personalidad(comunicativo),
    tiene_preferencia_laboral(dinamico).

cumple_requisitos(economia) :-
    tiene_habilidad(matematicas),
    tiene_interes(negocios),
    tiene_personalidad(analitico),
    tiene_preferencia_laboral(investigacion).

cumple_requisitos(contabilidad) :-
    tiene_habilidad(matematicas),
    tiene_interes(negocios),
    tiene_personalidad(meticuloso),
    tiene_preferencia_laboral(organizado).

cumple_requisitos(ingenieria_civil) :-
    tiene_habilidad(matematicas),
    tiene_habilidad(visualizacion_espacial),
    tiene_interes(construccion),
    tiene_personalidad(practico).

cumple_requisitos(biologia) :-
    tiene_habilidad(biologia),
    tiene_interes(investigacion),
    tiene_personalidad(curioso),
    tiene_preferencia_laboral(laboratorio).

cumple_requisitos(fisica) :-
    tiene_habilidad(matematicas),
    tiene_interes(investigacion),
    tiene_personalidad(logico),
    tiene_preferencia_laboral(laboratorio).

cumple_requisitos(quimica) :-
    tiene_habilidad(quimica),
    tiene_interes(investigacion),
    tiene_personalidad(meticuloso),
    tiene_preferencia_laboral(laboratorio).

cumple_requisitos(educacion) :-
    tiene_habilidad(comunicacion),
    tiene_interes(enseñanza),
    tiene_personalidad(paciente),
    tiene_preferencia_laboral(interaccion_social).

cumple_requisitos(turismo) :-
    tiene_habilidad(idiomas),
    tiene_interes(culturas),
    tiene_personalidad(extrovertido),
    tiene_preferencia_laboral(dinamico).

cumple_requisitos(relaciones_internacionales) :-
    tiene_habilidad(idiomas),
    tiene_interes(politica),
    tiene_personalidad(diplomatico),
    tiene_preferencia_laboral(interaccion_social).

% Reglas para determinar habilidades, intereses, etc.
tiene_habilidad(Habilidad) :-
    respuesta(Habilidad, si).

tiene_interes(Interes) :-
    respuesta(Interes, si).

tiene_personalidad(Rasgo) :-
    respuesta(Rasgo, si).

tiene_preferencia_laboral(Preferencia) :-
    respuesta(Preferencia, si).

% Preguntas al usuario
preguntar(Pregunta, Atributo) :-
    write(Pregunta), write(' (si/no): '),
    read(Respuesta),
    assertz(respuesta(Atributo, Respuesta)).

% Interfaz de usuario
iniciar :-
    retractall(respuesta(_,_)),
    writeln('=== SISTEMA DE RECOMENDACIÓN DE CARRERAS ==='),
    writeln('Responde las siguientes preguntas para recibir recomendaciones:'),
    nl,
    
    % Preguntas sobre habilidades
    preguntar('¿Eres bueno en matemáticas?', matematicas),
    preguntar('¿Tienes habilidad para resolver problemas?', resolucion_problemas),
    preguntar('¿Se te da bien la argumentación y debate?', argumentacion),
    preguntar('¿Consideras que eres creativo/a?', creatividad),
    preguntar('¿Tienes habilidades artísticas?', artistico),
    preguntar('¿Se te dan bien los idiomas?', idiomas),
    preguntar('¿Tienes facilidad para la biología?', biologia),
    preguntar('¿Tienes facilidad para la química?', quimica),
    preguntar('¿Tienes habilidades de liderazgo?', liderazgo),
    preguntar('¿Tienes buena comunicación?', comunicacion),
    preguntar('¿Tienes buena visualización espacial?', visualizacion_espacial),
    nl,
    
    % Preguntas sobre intereses
    preguntar('¿Te interesa la tecnología?', tecnologia),
    preguntar('¿Te interesa la salud?', salud),
    preguntar('¿Te interesa la salud mental?', salud_mental),
    preguntar('¿Te interesa la justicia?', justicia),
    preguntar('¿Te interesa el diseño?', diseño),
    preguntar('¿Te interesan los negocios?', negocios),
    preguntar('¿Te interesa la investigación?', investigacion),
    preguntar('¿Te interesa la enseñanza?', enseñanza),
    preguntar('¿Te interesa la construcción?', construccion),
    preguntar('¿Te interesa la política?', politica),
    preguntar('¿Te interesan otras culturas?', culturas),
    nl,
    
    % Preguntas sobre personalidad
    preguntar('¿Eres una persona analítica?', analitico),
    preguntar('¿Eres empático/a?', empatico),
    preguntar('¿Eres organizado/a?', organizado),
    preguntar('¿Eres comunicativo/a?', comunicativo),
    preguntar('¿Eres innovador/a?', innovador),
    preguntar('¿Eres extrovertido/a?', extrovertido),
    preguntar('¿Eres meticuloso/a?', meticuloso),
    preguntar('¿Eres práctico/a?', practico),
    preguntar('¿Eres curioso/a?', curioso),
    preguntar('¿Eres lógico/a?', logico),
    preguntar('¿Eres paciente?', paciente),
    preguntar('¿Eres diplomático/a?', diplomatico),
    preguntar('¿Eres persuasivo/a?', persuasivo),
    nl,
    
    % Preguntas sobre preferencias laborales
    preguntar('¿Prefieres trabajo en equipo?', trabajo_equipo),
    preguntar('¿Prefieres autonomía en tu trabajo?', autonomia),
    preguntar('¿Te gustaría trabajar en investigación?', investigacion),
    preguntar('¿Te gusta la interacción social en el trabajo?', interaccion_social),
    preguntar('¿Prefieres un ambiente laboral dinámico?', dinamico),
    preguntar('¿Te gustaría trabajar en laboratorio?', laboratorio),
    nl,
    
    % Mostrar recomendaciones
    writeln('=== TUS CARRERAS RECOMENDADAS ==='),
    findall(C, recomendar_carrera(C), _),
    (\+ respuesta(_, si) -> writeln('No se encontraron carreras que coincidan con tus respuestas.'); true).

% Iniciar el sistema
:- iniciar.