From: "William J. Earl" <wje@cthulhu.engr.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14459.34255.60876.700493@liveoak.engr.sgi.com>
Date: Tue, 11 Jan 2000 11:34:39 -0800 (PST)
Subject: Re: X server
In-Reply-To: <E1281JK-0004hu-00@the-village.bc.nu>
References: <20000111030346.42694.qmail@hotmail.com>
	<E1281JK-0004hu-00@the-village.bc.nu>
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Bill Halchin <bhalchin@hotmail.com>, ralf@oss.sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <20000111193439.z6EGenNe3YSnjtnMzfCyBqjJ0_2VH59pBym7WljwidU@z>

Alan Cox writes:
 > > Ralf,
 > >   What I am saying is why don't we try this approach.
 > 
 > "we". I have this cool idea - "You" 
 > 
 > Actually  for an Indy X server your best model is still the 8514 driver in XFree

      That sounds right to me as well.  The problem with fbcon or GGI
is that the Indy graphics hardware does not have a CPU-addressable
frame buffer.  You can always fake one in main memory, and DMA any
modified portions to the real frame buffer, but a naive implementation
would use more memory bandwidth than is available and a clever
implementation would incur a lot of VM overhead (and still use a lot
of bandwidth).  Starting from an X server designed for hardware without
an addressable frame buffer is more appropriate.
  
