Message-ID: <02e701c13418$7f51a0c0$056aaac0@kjlin>
From: "kjlin" <kj.lin@viditec-netmedia.com.tw>
References: <02b801c13203$f52ad440$056aaac0@kjlin> <999283122.29395.45.camel@ez>
Subject: Re: compile C++ code
Date: Mon, 3 Sep 2001 09:33:56 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
To: linux-mips@oss.sgi.com
Message-ID: <20010903013356.-FQJ7b5-JweP3a-vQyMMViFSLxKZJ3wWQOR-U3gt22E@z>


> > #mips-linux-gcc test.C
> > /usr/lib/gcc-lib/mips-linux/egcs-2.91.66/libgcc.a(frame.o): In function
`decode_uleb128':
> >
/usr/src/redhat/BUILD/egcs-1.1.2/target-mips-linux/gcc/../../gcc/frame.c(.da
ta+0x0): undefined reference to `pthread_create'
> > /usr/mips-linux/bin/ld: bfd assertion fail ../../bfd/elf32-mips.c:5123
> > mips-linux-gcc: Internal compiler error: program ld got fatal signal 11
> > #mips-linux-g++ test.C
> > /usr/mips-linux/lib/libstdc++.so: undefined reference to
`pthread_create'
> > /usr/mips-linux/lib/libstdc++.so: undefined reference to
`pthread_getspecific'
> > /usr/mips-linux/lib/libstdc++.so: undefined reference to `pthread_once'
> > /usr/mips-linux/lib/libstdc++.so: undefined reference to
`pthread_key_create'
> > /usr/mips-linux/lib/libstdc++.so: undefined reference to
`pthread_setspecific'
> >
> It seems you should link with pthread lib :
> #mips-linux-g++ test.C -lpthread
>
> I think the libgcc.a should be linked with it ... Can anyone tell us
> further on that subject?

Yes, if i link with "-lpthread" , the error is solved.
But i am confused that when i compile the same code with native gcc/g++, it
is needless to link with that option.
Why?
