Message-ID: <01c701c08268$a4965860$0deca8c0@Ulysses>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <0101191014100B.01043@plugh.sibyte.com>
Subject: Re: R[45]KC PRiD fields?
Date: Fri, 19 Jan 2001 23:39:09 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: carlson@sibyte.com, linux-mips@oss.sgi.com
Message-ID: <20010119223909.tzA6IXmxYGQiLD_X_HHqe79WgNSniNK1Zeeqpd9qgZA@z>

> Does anyone happen to know what the R4Kc anc R5KC use for the company ID
of the
> PrID register (bits 23-16)?  I'm assuming it's 1, which is reserved for
MTI,
> but bits 15-8 seem to be carefully chosen not to conflict with previous
> processors in the non-MIPS32/MIPS64 PRiD space.

The MIPS 4KC has a PrID of 0x000180xx
The MIPS 5KC has a PrID of 0x000181xx

            Kevin K.
