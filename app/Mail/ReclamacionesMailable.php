<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\libro;

class ReclamacionesMailable extends Mailable
{
    use Queueable, SerializesModels;

    public $subject = "SYSCOPY PERU : Libro de Reclamaciones";
    public $libro;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(libro $libro)
    {
        $this->libro = $libro;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.confirmacion');
    }
}
