<?php
class TodoItem
{
    public $todo_id;
    public $title;
    public $description;
    public $due_date;
    public $is_done;
     
    public function save($username, $userpass)
    {
        //get the username/password hash
        $userhash = sha1("{$username}_{$userpass}");
        if( is_dir(DATA_PATH."/{$userhash}") === false ) {
            mkdir(DATA_PATH."/{$userhash}");
        }
         
        //if the $todo_id isn't set yet, it means we need to create a new todo item
        if( is_null($this->todo_id) || !is_numeric($this->todo_id) ) {
            //the todo id is the current time
            $this->todo_id = time();
        }
         
        //get the array version of this todo item
        $todo_item_array = $this->toArray();
         
        //save the serialized array version into a file
        $success = file_put_contents(DATA_PATH."/{$userhash}/{$this->todo_id}.txt", serialize($todo_item_array));
         
        //if saving was not successful, throw an exception
        if( $success === false ) {
            throw new Exception('Failed to save todo item');
        }
         
        //return the array version
        return $todo_item_array;
    }
     
    public function toArray()
    {
        //return an array version of the todo item
        return array(
            'todo_id' => $this->todo_id,
            'title' => $this->title,
            'description' => $this->description,
            'due_date' => $this->due_date,
            'is_done' => $this->is_done
        );
    }
}