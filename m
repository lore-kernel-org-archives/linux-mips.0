Message-ID: <000f01c198b6$d627ffe0$9b6e0b0a@huawei.com>
From: "machael thailer" <dony.he@huawei.com>
References: <003301c198af$1c0d0a80$9b6e0b0a@huawei.com> <20020109015128.GB23506@conectiva.com.br>
Subject: Re: limited Memory question...
Date: Wed, 9 Jan 2002 10:39:18 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-linux-mips@oss.sgi.com
To: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020109023918.ow2jejjc8TfeplomuS_akSlKQ1_y1osKVUJh1kGBCec@z>

> > I have a question to need you help. Our MIPS-based custom board has only
> > 8M memory.When I want to insmod a 24M module, it often panics and says
> > "out of memory...".
> 
> a kernel module? 24MiB? ouch, if that is the case, the only way is to get
> more memory for your board, as kernel memory is not swappable...

Yes, it is a kernel module.  
But unfortunately, the memory is fixed on our board and we cannot add more memory.
Any other ideas?
