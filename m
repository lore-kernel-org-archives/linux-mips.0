Message-ID: <001401c1d161$eef48640$0b01a8c0@w2k30g>
From: "David Christensen" <dpchrist@holgerdanske.com>
Subject: Fw: Fw: Fw: hello
Date: Thu, 21 Mar 2002 21:24:37 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20020322052437.oc4LD_Nb0cHlv15PmYoBWnG-Oa57OlCubm8aEjKO6r0@z>

linux-mips@oss.sgi.com:

Hartvig Ekner <hartvige@mips.com> wrote:
>> What host hardware platform(s) and host operating system(s) does MIPS
>> use to build their MIPS Linux distribution as found on
>> ftp://ftp.mips.com/pub/linux/mips/?
>
> We use commercial Redhat x86/Linux hosts with the cross compiler link
> I sent for kernel compiles. All the binary RPM's are directly from
> H.J.s miniport (which I believe is mostly crosscompiled), and then we
> added some of the nfs/cdrom installation scripts around all this. We
> only rebuild parts of userland (most often native) from the SRPMS when
> necessary for internal debug etc, but this is purely for debug, not
> re-distribution.
>
> All of H.J's binary RPMs for the userland and the corresponding source
> RPMs we used can be found at:
>
> ftp://oss.sgi.com/pub/linux/mips/redhat/7

Great!  Thanks for all the help.  :-)


David
