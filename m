Message-ID: <004101c198bb$988a6ec0$9b6e0b0a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <E16O9BM-0008W9-00@the-village.bc.nu>
Subject: Re: limited Memory question...
Date: Wed, 9 Jan 2002 11:13:22 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-mips@oss.sgi.com, Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Message-ID: <20020109031322.rjwdoTuiK74AgQHy1N-NwnbOoxwz03j399C8BC1uveI@z>

> >     I have a question to need you help. Our MIPS-based custom board has only
> > 8M memory.When I want to insmod a 24M module, it often panics and says "out 
> > of memory...".
> > How can I solve this?
> 
> Stop the module using 24Mb of unpageable memory ?

Sorry , I think I didn't describe my questions clearly before.

"24M" contains some debugging information. I compile it using "-g".
code+data sections is only about 7.4M.

Can you describe your solutions in more details?

machael.
