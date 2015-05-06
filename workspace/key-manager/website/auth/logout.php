<?php
session_start();
session_destroy();
# Nur in harten Fällen benutzen, wenn der Server session_destroy() nicht korrekt unterstützt # unlink ( SESSION_FILE_DIR . '/sess_' . session_id());
  header('Location: http://' . $_SERVER['HTTP_HOST'] . rtrim(dirname($_SERVER['SCRIPT_NAME'])
  ?>