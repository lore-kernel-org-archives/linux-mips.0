Date: Fri, 8 Sep 2000 19:16:12 -0700
From: Keith M Wesolowski <wesolows@chem.unr.edu>
Subject: Re: glibc again
Message-ID: <20000908191612.B17687@chem.unr.edu>
References: <20000909000736.A6050@bilbo.physik.uni-konstanz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20000909000736.A6050@bilbo.physik.uni-konstanz.de>; from guido.guenther@gmx.net on Sat, Sep 09, 2000 at 12:07:36AM +0200
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Guido Guenther <guido.guenther@gmx.net>
Cc: linux-mips@oss.sgi.com
Message-ID: <20000909021612.Sy0KEifBmfg5SbftxzZDbHfxWQJXACOL1H0moLQfVbw@z>

On Sat, Sep 09, 2000 at 12:07:36AM +0200, Guido Guenther wrote:

> with latest cvs I've been able to crossbuild glibc. When trying 
> to crosscompile programs against it I ended up with
> lots of unresolved symbols. This all changed when I edited
> /usr/local/mips-linux/lib/libc.so from 
> GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a ) to 
> GROUP ( libc.so.6 libc_nonshared.a )
> Should I consider this a bug in a) my "setup", b) glibc c) to be
> intended behavior?

I'm astonished it only complained about unresolved symbols. If you
leave it as is, it tries to link in your build system's libraries. I
always replace the two with full paths to the mips libraries. I'm
fairly sure this is also in my cross-build faq.

From make-cross.sh:

        # *sigh* This is the fun part. We need to fix up libc.so so that
        # it points to files in our filesystem, not the mythical /usr dirs
        # we would have if this were native.
        echo "Fixing up libc.so locations"
        sed -e s%/lib/libc.so.6%"${_destdir}/$TARGET/lib/libc.so.6"%g \
            -e s%/usr/lib/%"${_destdir}/$TARGET/lib/"%g \
          < "${_destdir}/$TARGET/lib/libc.so" \
          > "${_destdir}/$TARGET/lib/.new.libc.so" || exit 1
        mv -f "${_destdir}/$TARGET/lib/.new.libc.so" \
          "${_destdir}/$TARGET/lib/libc.so" || exit 1

Finding a nicer way is left as an exercise...

-- 
Keith M Wesolowski			wesolows@chem.unr.edu
University of Nevada			http://www.chem.unr.edu
Chemistry Department Systems and Network Administrator
