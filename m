Subject: Re: csum_ipv6_magic()
Date: Mon, 22 Oct 2001 08:55:35 +0100 (BST)
In-Reply-To: <20011022151606V.machida@sm.sony.co.jp> from "Machida Hiroyuki" at Oct 22, 2001 03:16:06 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E15vZvr-000138-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Machida Hiroyuki <machida@sm.sony.co.jp>
Cc: Ralf Baechle <ralf@uni-koblenz.de>, linux-mips@oss.sgi.com
Message-ID: <20011022075535.7SfJ9zYljceOFSFssvckJNU1ohYjRkoXUz993w0aCXU@z>

> I guess that csum_ipv6_magic() in include/asm-mips/checksum.h 
> needs "addu %0, $1" at the next of "sltu $1, %0, $1".
> Without this, you cannot add a carry of the last addtion.

Is that actually needed. The final end around carry cannot itself cause
a second carry.
