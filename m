Subject: Re: RAMDISK problem on 79s334A board.
Date: Wed, 15 May 2002 14:28:59 +0100 (BST)
In-Reply-To: <Pine.LNX.4.10.10205151729240.22271-100000@brahma.intotoind.com> from "Venkata Rajesh Bikkina" at May 15, 2002 05:30:50 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E177ypv-0001up-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Venkata Rajesh Bikkina <rajeshbv@intotoinc.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-mips@oss.sgi.com
Message-ID: <20020515132859.V8ug0BCfDeNRbAB_urWln0i2zyVsExgj76_VTwOQM_Q@z>

> But the same module is working fine and kernel is also fine if i use NFS
> and insert the module.
> Any further info ?

Not really. The fact it works with NFS and not ramdisk may simply be that
in one case it corrupts memory that is used, and the other it corrupts
memory that isnt
