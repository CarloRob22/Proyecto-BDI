USE GameManager;

DROP TRIGGER IF EXISTS tg_delUserJournal;

DELIMITER $$
CREATE TRIGGER tg_delUserJournal
    AFTER DELETE
    ON User FOR EACH ROW
BEGIN
    DECLARE nickname VARCHAR(30);    

    SELECT 
        old.var_nickname INTO nickname
    FROM 
        User
    ;
    
    INSERT INTO Journal(var_action, big_user_FK) VALUES
        (CONCAT("El administrador eliminó al usuario jugador ", nickname), old.big_id)
    ;
END $$

DELIMITER ;