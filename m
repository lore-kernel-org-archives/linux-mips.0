Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Subject: RE: Problems debugging multithreaded program wirh gdbserver via ser
	 ial port
Date: Tue, 9 Nov 2004 18:08:47 +0200
Message-ID: <D6FAAE89E48C5B488B41BEBBDCD746CD09E7D3@tndcmail.Teledata.Local>
From: "Yoni Rabinovitch" <Yoni.Rabinovich@Teledata-Networks.com>
Return-Path: <Yoni.Rabinovich@Teledata-Networks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Daniel Jacobowitz <dan@debian.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20041109160847.SIAqdOKWdkaez5fOXDk2qOn7iVvixadcN8nqk4M2mRE@z>

>> Simultaneously, in the gdbserver session (via minicom) I see:
>> +$OK#9a

>Um.... you're running with a serial port open on the same port you're
>trying to debug on?  That can't work.  Use one for console and the
>other for gdbserver, or come to some other arrangement if your board
>only has one.

OK, thanks. I now have this sorted out. It seems the only way it agrees to work
is if I start gdbserver in a minicom session, and then kill -9 the minicom session, and then connect
with gdb.

So, now I have basic (command line) gdb <-> gdbserver working OK over the serial connection.

However, I am trying to run gdb from a GUI front end, which is running gdb/mi.
What I am seeing is that the GUI is invoking gdb/mi stack-info-depth, which seems to be
causing a memory exception in frame_register_unwind ("Cannot access memory at address 0x2c").
Thus, even though gdb is able to decipher the stack, the error at the end of the backtrace causes
the gdb/mi GUI to choke.

How can I work around this ?

Thanks !! 
