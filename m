Message-ID: <003601c1a138$868fdc20$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <025901c1a0c4$30ec20e0$3d6e0b0a@huawei.com>
Subject: Re: use float in no-fpu mips kernel modules?
Date: Sat, 19 Jan 2002 23:27:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: renc stone <renwei@huawei.com>, linux-mips@oss.sgi.com
Message-ID: <20020119222737.XY1Z_SH41VEQHH3uVVriBgaWF1TOPq2q2Eg1b6M3kiQ@z>

>   Any one know how to use float point in mips kernel?
>   We use some 2.4.5 kernel, on idt mips 32334, which has no fpu, I think.
>   we want to use the float numbers like this:
>   float a = 87;
>   a * = 1.04;
>   Any kernel functions to do this? or how to compile it use soft fpu
> support?

The way I integrated the Algorithmics FPU emulaton
code into the kernel *used* to work for kernel FP.
Maybe someone has broken it since, and there may
well be situations where it was unsafe, but have you 
tried simply confuguring FPU emulation and running 
your code with it?

            Kevin K.
