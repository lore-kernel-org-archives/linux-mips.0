From: "Kjeld Borch Egevang" <kjelde@mips.com>
Subject: RE: Error in gcc version 2.96 20000731
Date: Thu, 13 Sep 2001 23:09:04 +0200
Message-ID: <NFBBKGGKGLLGNBGCEPKIEEHDCAAA.kjelde@mips.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010913081040.A24910@lucon.org>
Sender: owner-linux-mips@oss.sgi.com
To: "H . J . Lu" <hjl@lucon.org>
Cc: linux-mips@oss.sgi.com
Message-ID: <20010913210904.yjuqSOXF2B2kr1ix4x7JWt8PGKO6JO9ABcHgwEL_mEQ@z>

Perhaps I don't get you point, but I get the same with:

int main()
{
  rtx rt;

  put_code(&rt, (short)5);
  printf("gen_rtx, code=%d\n", (int)rt.code);
}


/Kjeld

-----Original Message-----
From: owner-linux-mips@oss.sgi.com
[mailto:owner-linux-mips@oss.sgi.com]On Behalf Of H . J . Lu
Sent: 13. september 2001 17:11
To: Kjeld Borch Egevang
Cc: linux-mips@oss.sgi.com
Subject: Re: Error in gcc version 2.96 20000731


On Thu, Sep 13, 2001 at 04:15:10PM +0200, Kjeld Borch Egevang wrote:
> Hi all.
>
> I discovered an optimization error in the current gcc for MIPS.
>
> When I compile the code below with -O2 it clears the code-field just
> after setting it. The instructions are mixed up. It works fine with -O1
> and -O0.
>
> If the "//" is removed in front of the first printf, it works too.
>

The code isn't ISO C. You cannot declare something as short and then
access it as int. On x86:

# gcc alias.c -O
put_code after, code=5 5
gen_rtx, code=5
# gcc alias.c -O2
put_code after, code=5 0
gen_rtx, code=0

On mips,

# gcc alias.c -O
put_code after, code=5 5
gen_rtx, code=5
# gcc alias.c -O2
put_code after, code=5 5
gen_rtx, code=0

You can fix the code or add -fno-strict-aliasing

# gcc alias.c -O2 -fno-strict-aliasing
put_code after, code=5 5
gen_rtx, code=5



H.J.
