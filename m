Date: Tue, 8 Jan 2002 23:51:29 -0200
From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Subject: Re: limited Memory question...
Message-ID: <20020109015128.GB23506@conectiva.com.br>
References: <003301c198af$1c0d0a80$9b6e0b0a@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003301c198af$1c0d0a80$9b6e0b0a@huawei.com>
Sender: owner-linux-mips@oss.sgi.com
To: machael thailer <dony.he@huawei.com>
Cc: linux-mips@oss.sgi.com, Ralf Baechle <ralf@oss.sgi.com>
Message-ID: <20020109015129.aNzURZ5y2nwJyC-BwFaFAV4JDlJYn1A-53e7If3-ozA@z>

Em Wed, Jan 09, 2002 at 09:43:59AM +0800, machael thailer escreveu:

> I have a question to need you help. Our MIPS-based custom board has only
> 8M memory.When I want to insmod a 24M module, it often panics and says
> "out of memory...".

a kernel module? 24MiB? ouch, if that is the case, the only way is to get
more memory for your board, as kernel memory is not swappable...

- Arnaldo
