Message-ID: <001101c16725$c0a6eae0$4a1c690a@huawei.com>
From: "machael" <dony.he@huawei.com>
References: <013301c165cc$5d030fa0$4a1c690a@huawei.com> <20011106130839.B30219@dea.linux-mips.net>
Subject: Re: vmalloc bugs in 2.4.5???
Date: Wed, 7 Nov 2001 08:47:18 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20011107004718.Tzx8JRkTGj6ZPjRPJCsv1hHuW6sApq3kr97fCs0umEA@z>

> >     I use linux-2.4.5 and I think VMALLOC may have some bugs which i
don't
> > know how to fixup.
>
> Vmalloc is probably innocent I'd rather guess cache flushing is broken on
> your platform.

Yes, It is possible. But I don't know how to fixup this broken cache
flushing?
And when and where should I flush cache (icache and dcache) manually?I am
really know little things about cache.

Can you help me?
Thank you very much.

machael
