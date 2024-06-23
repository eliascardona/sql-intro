CREATE DATABASE EnfermeriaComunitario;
USE EnfermeriaComunitario;
CREATE TABLE Familia (
    familia_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ingreso_mensual_familiar DECIMAL(10, 2) NOT NULL,
    responsable_familia VARCHAR(100) NOT NULL,
    domicilio VARCHAR(100) NOT NULL,
    num_manzana INT NOT NULL,
    conformacion_familiar VARCHAR(100) NOT NULL,
    num_integrantes INT NOT NULL,
    lugar_procedencia VARCHAR(100) NOT NULL,
    religion VARCHAR(50) NOT NULL,
    seguridad_social TINYINT(1) NOT NULL,
    num_familiares_emigrados INT NOT NULL,
    lugar_emigracion VARCHAR(100) NOT NULL,
    motivo_emigracion VARCHAR(100) NOT NULL,
    agua_consumo_humano TINYINT(1) NOT NULL,
    lava_manos_antes_comer TINYINT(1) NOT NULL,
    lava_manos_posterior_wc TINYINT(1) NOT NULL,
    frecuencia_higiene_bucal VARCHAR(50) NOT NULL,
    frecuencia_bano_completo VARCHAR(50) NOT NULL,
    manejo_desechos VARCHAR(100) NOT NULL
);
CREATE TABLE InfoPersonal (
    persona_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    edad INT NOT NULL,
    sexo VARCHAR(255) NOT NULL,
    parentesco VARCHAR(255) NOT NULL,
    escolaridad VARCHAR(255) NOT NULL,
    estado_civil VARCHAR(255) NOT NULL,
    ocupacion VARCHAR(255) NOT NULL,
    fuma TINYINT(1) NOT NULL,
    consume_alcohol TINYINT(1) NOT NULL,
    consume_drogas_licitas TINYINT(1) NOT NULL,
    se_automedica TINYINT(1) NOT NULL,
    otras_adicciones VARCHAR(255) NOT NULL,
    control_nutricional TINYINT(1) NOT NULL,
    desparasitacion_vigente TINYINT(1) NOT NULL,
    embarazada TINYINT(1) NOT NULL,
    trimestre_embarazo VARCHAR(255) NOT NULL,
    cartilla_vacunacion TINYINT(1) NOT NULL,
    vacunacion_pediatricos TINYINT(1) NOT NULL,
    vacunacion_adolescentes_adultos TINYINT(1) NOT NULL,
    detecciones_valoraciones TINYINT(1) NOT NULL,
    peso DECIMAL(8, 2) NOT NULL,
    talla DECIMAL(8, 2) NOT NULL,
    tipo_de_embarazo VARCHAR(255) NOT NULL,
    lleva_control_prenatal TINYINT(1) NOT NULL,
    lactancia_materna TINYINT(1) NOT NULL,
    refierido_motivo VARCHAR(255) NOT NULL,
    metodo_de_planificacion_familiar VARCHAR(255) NOT NULL,
    its TINYINT(1) NOT NULL,
    tipo_accidente VARCHAR(255) NOT NULL,
    lugar_accidente VARCHAR(255) NOT NULL,
    tipo_de_violencia VARCHAR(255) NOT NULL,
    lugar_violencia VARCHAR(255) NOT NULL,
    imc DECIMAL(8, 2) NOT NULL,
    act_fisica TINYINT(1) NOT NULL,
    tipo_de_pescado VARCHAR(255) NOT NULL,
    alergias_de_salud VARCHAR(255) NOT NULL,
    remotefobia TINYINT(1) NOT NULL,
    ha_recibido_edu_para_la_salud_familiar TINYINT(1) NOT NULL,
    familia_id INT UNSIGNED,
    FOREIGN KEY (familia_id) REFERENCES Familia(familia_id)
);
CREATE TABLE HabitosAlimenticios (
    habitos_alim_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    consumo_3_grupos TINYINT(1) NOT NULL,
    cantaciones_semana INT NOT NULL,
    comidas_dia INT NOT NULL,
    comen_viendo_television TINYINT(1) NOT NULL,
    se_reunen_para_comer TINYINT(1) NOT NULL,
    consumen_golosinas TINYINT(1) NOT NULL,
    comida_mas_frecuente VARCHAR(100) NOT NULL,
    persona_id INT UNSIGNED,
    FOREIGN KEY (persona_id) REFERENCES InfoPersonal(persona_id)
);
CREATE TABLE Casa (
    casa_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    no_habitaciones INT NOT NULL,
    no_vecindarios INT NOT NULL,
    cocina_separada VARCHAR(50) NOT NULL,
    tipo_combustible VARCHAR(50) NOT NULL,
    paredes VARCHAR(50) NOT NULL,
    techos VARCHAR(50) NOT NULL,
    piso VARCHAR(50) NOT NULL,
    luz_electrica TINYINT(1) NOT NULL,
    fuente_agua VARCHAR(50) NOT NULL,
    como_llega_agua_casa VARCHAR(100) NOT NULL,
    tratamiento_basura VARCHAR(100) NOT NULL,
    fauna_nociva VARCHAR(100) NOT NULL,
    animales_domesticos TINYINT(1) NOT NULL,
    animales_vacunados TINYINT(1) NOT NULL,
    expende_productos TINYINT(1) NOT NULL,
    permiso_reglamentario TINYINT(1) NOT NULL,
    familia_id INT UNSIGNED,
    FOREIGN KEY (familia_id) REFERENCES Familia(familia_id)
);
CREATE TABLE Mortalidad (
    mortalidad_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mortalidad_cinco_anios INT NOT NULL,
    edad_fallecidos INT NOT NULL,
    sexo_fallecidos VARCHAR(10) NOT NULL,
    causa_muerte VARCHAR(100) NOT NULL,
    morbilidad_ultimo_ano TINYINT(1) NOT NULL,
    edad_enfermos INT NOT NULL,
    sexo_enfermos VARCHAR(10) NOT NULL,
    causa_enfermedad VARCHAR(100) NOT NULL,
    diagnosticados_tratamiento TINYINT(1) NOT NULL,
    necesidades_companataras_servicios VARCHAR(100) NOT NULL,
    familia_id INT UNSIGNED,
    FOREIGN KEY (familia_id) REFERENCES Familia(familia_id)
);






-- *******************************************************************************************************************************************
-- ******************************                INSERCIÓN DE DATOS DE PRUEBA EN LAS TABLAS                  *********************************
-- *******************************************************************************************************************************************
INSERT INTO Familia(ingreso_mensual_familiar, responsable_familia, domicilio, num_manzana, conformacion_familiar, num_integrantes, lugar_procedencia, religion, seguridad_social, num_familiares_emigrados, lugar_emigracion, motivo_emigracion, agua_consumo_humano, lava_manos_antes_comer, lava_manos_posterior_wc, frecuencia_higiene_bucal, frecuencia_bano_completo, manejo_desechos)
VALUES 
(1500.00, 'Juan Perez', 'Calle 123', 1, 'Nuclear', 4, 'Ciudad', 'Catolica', 1, 0, '', '', 1, 1, 1, 'Diaria', 'Diaria', 'Basura Municipal'),
(2500.00, 'Ana Gomez', 'Calle 456', 2, 'Extendida', 5, 'Pueblo', 'Cristiana', 1, 2, 'USA', 'Trabajo', 1, 1, 1, 'Diaria', 'Semanal', 'Basura Municipal');


INSERT INTO InfoPersonal (edad, sexo, familia_id) VALUES (23, 'Masculino', 1), (43, 'Femenino', 2);


INSERT INTO HabitosAlimenticios(consumo_3_grupos, cantaciones_semana, comidas_dia, comen_viendo_television, se_reunen_para_comer, consumen_golosinas, comida_mas_frecuente, persona_id)
VALUES
(1, 5, 3, 1, 1, 1, 'Arroz', 1),
(1, 7, 3, 0, 1, 0, 'Tacos', 2);


INSERT INTO Casa(no_habitaciones, no_vecindarios, cocina_separada, tipo_combustible, paredes, techos, piso, luz_electrica, fuente_agua, como_llega_agua_casa, tratamiento_basura, fauna_nociva, animales_domesticos, animales_vacunados, expende_productos, permiso_reglamentario, familia_id)
VALUES
(3, 1, 'Si', 'Gas', 'Ladrillo', 'Lamina', 'Cemento', 1, 'Red Publica', 'Tuberia', 'Recoleccion', 'Ratas', 1, 1, 0, 0, 1),
(4, 1, 'No', 'Lenia', 'Adobe', 'Teja', 'Tierra', 1, 'Pozo', 'Cubetas', 'Quema', 'Cucarachas', 1, 0, 1, 1, 2);


INSERT INTO Mortalidad(mortalidad_cinco_anios, edad_fallecidos, sexo_fallecidos, causa_muerte, morbilidad_ultimo_ano, edad_enfermos, sexo_enfermos, causa_enfermedad, diagnosticados_tratamiento, necesidades_companataras_servicios, familia_id)
VALUES
(1, 70, 'Masculino', 'Infarto', 1, 50, 'Femenino', 'Diabetes', 1, 'Insulina', 1),
(2, 65, 'Femenino', 'Cancer', 1, 40, 'Masculino', 'Hipertension', 1, 'Medicacion', 2);
