Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Ralf Baechle <ralf@mailhost.uni-koblenz.de>
Message-ID: <199707152215.AAA20071@informatik.uni-koblenz.de>
Subject: Re: Fun with binutils ...
Date: Wed, 16 Jul 1997 00:15:15 +0200 (MET DST)
In-Reply-To: <199707151948.PAA08407@jenolan.rutgers.edu> from "David S. Miller" at Jul 15, 97 03:48:12 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: "David S. Miller" <davem@jenolan.rutgers.edu>
Cc: ralf@mailhost.uni-koblenz.de, linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr
Message-ID: <19970715221515.pxjWCxwGvNmarPimeBigKBs1zxXqmLvWUU5yWKVWmBc@z>

>     - GAS still doesn't deal with _huge_ loops.  The only program I know
>       of which is affected is lmbench, but that alone is reason enough
>       to fix it :-)
> 
> It is not a bug, just that we have the local label semantics specified
> for linux-mips differently in gcc and gas.  I fixed this ages ago and
> it made lat_ctx.c compile just fine.

It has nothing to do with local label semantics of GCC; I can easily trigger
the problem in plain assembler using local or nonlocal labels.  Maybe you
were still using a non-PIC lat_ctx at that time?  The problem only affects 
PIC.  Another explanation would be that the size of the cacheflushing
loop in lmbench was somewhen increased or the GCC variant you used generates
different branches.  The problematic GAS code from:
binutils/gas/config/tc-mips.c:

[...]
  3439      case M_BGTL_I:
  3440        likely = 1;
  3441      case M_BGT_I:
[...]
  3470        if (imm_expr.X_op != O_constant)
  3471          as_bad ("Unsupported large constant");
[...]
  3536      case M_BGTUL_I:
  3537        likely = 1;
  3538      case M_BGTU_I:
[...]
  3544        if (imm_expr.X_op != O_constant)
  3545          as_bad ("Unsupported large constant");
[...]
  3632      case M_BLEL_I:
  3633        likely = 1;
  3634      case M_BLE_I:
[...]
  3647        if (imm_expr.X_op != O_constant)
  3648          as_bad ("Unsupported large constant");
[...]
  3694      case M_BLEUL_I:
  3695        likely = 1;
  3696      case M_BLEU_I:
[...]
  3702        if (imm_expr.X_op != O_constant)
  3703          as_bad ("Unsupported large constant");

  Ralf
