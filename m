Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Alan Cox <alan@cymru.net>
Message-ID: <199605160935.KAA09812@snowcrash.cymru.net>
Subject: Re: lmbench with new checksum code...
Date: Thu, 16 May 1996 10:35:04 +0100 (BST)
In-Reply-To: <199605160653.CAA12098@huahaga.rutgers.edu> from "David S. Miller" at May 16, 96 02:53:50 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <davem@caip.rutgers.edu>
Cc: lmlinux@neteng.engr.sgi.com, torvalds@cs.helsinki.fi, sparclinux-cvs@caipfs.rutgers.edu, alan@cymru.net
Message-ID: <19960516093504.iii-JttQF51E_8qes8evgo-tjqhyo7Wf7p-5RHY0fIc@z>

> I doubt I can get 2mb/s more out of my code to beat solaris, sigh,
> where the heck could all this overhead possibly be???

What makes you think the Solaris loopback is even doing checksums or a memcpy
via kernel space ? They only way you'll beat solaris at the loopback network
game is to cheat as they do. Make tcp_connect spot a localhost connection
change the socket method to something akin to af_unix but streamlined a bit
(only special case is urgent data).

Alan
