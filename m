Message-ID: <00c501c0ef60$ceb4d3f0$662d44c3@yoshi>
From: "julien" <julien@iside.net>
Subject: new comer question
Date: Thu, 7 Jun 2001 16:47:42 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010607144742.tPgHS8HzJ3h_X_Ljb7T9lcJpTiw7jYgPqT6u264vbkU@z>

Hi all,

First of all, I apologize for asking this kind of questions here, as
there is not many ressources for sgi/linux.

I'm following this list's discussions since many months, and I decided
to get linux running on my Indy box (R4400, Newport gfx)... To do so, I
followed standard installation instructions and used the hardhat5.1
archive located at ftp://oss.sgi.com/pub/linux/mips/redhat ...  I set up
the tftp / bootp / nfs root  on a FreeBSD box as we don't have any Linux
here, but this shouldn't be a problem, should it ?
At this point, the kernel seems to boot without any problems up to the
mount root stage, and after it crashes. Here is the last part of the
kernel outpout, transcribed by hand (hope there is all informations
needed) :

...
VFS: Mounted root (nfs filesystem)
Freeing unused kernel memory : 44k freed
page fault from irq handler : 0000
$0 : <some hexdump>                        <-- do you need these dumps
to understand what's happening ?
$4 : <some hexdump>
...
$28 : <some hexdump>
epc : 880e3e74
Status : 1004fc02
Cause : 00000008
Aiee, killing interrupt handler
Kernel panic : Attempted to kill the idle task
In swapper task - not syncing

I would appreciate any help, as you have many other better things to do
than helping newbies.

Thanx in advance

--
-------------------------------
--> julien@iside.net
-------------------------------
