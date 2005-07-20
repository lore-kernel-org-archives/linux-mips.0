Message-ID: <010901c58d28$15e2a3b0$6cf9a8c0@ALEC>
Reply-To: "Alexander Voropay" <alec@artcoms.ru>
From: "Alexander Voropay" <alec@artcoms.ru>
References: <f07e6e05071909301c212ab4@mail.gmail.com> <20050719164427.GB8758@linux-mips.org> <f07e6e05071910194bab9b16@mail.gmail.com> <1121802786.7285.88.camel@localhost.localdomain> <Pine.LNX.4.61L.0507200955390.30702@blysk.ds.pg.gda.pl> <f07e6e05072002197b529b72@mail.gmail.com>
Subject: Re: bal instruction in gcc 3.x
Date: Wed, 20 Jul 2005 16:39:31 +0400
MIME-Version: 1.0
Content-Type: text/plain;
	format=flowed;
	charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Return-Path: <alec@artcoms.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kishore K <hellokishore@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20050720123931.WK5-QGAisTiWZK7xF7lETlD0z1YUgeEQIAhZeuogeOU@z>

<hellokishore@gmail.com> wrote:

>>> However, if I compile the code with gcc3, it exits with the
>>>error "Cannot branch to unknown symbol".

> On the other hand, if I replace 
> 
> bal jump_to_label   
> 
> by 
> 
> la t9, jump_to_label
> jalr t9
> 
> I don't see any warning. What could be the reason ?


1) With "jal label " you'll have a MIPS_26 RELOC type in the ELF obj file:

  jal  lablel

00000000 <.text>:
   0:   0c000000        jal     0x0
   4:   00000000        nop

RELOCATION RECORDS FOR [.text]:
OFFSET   TYPE              VALUE
00000000 R_MIPS_26         label


2) The "la r,label" is a syntetic inctruction wich expanded into two:
"lui r,%hi label  ; addui r,%lo label". It gives you two RELOCs:

  la  t0, label
  jalr t0

00000000 <.text>:
   0:   3c080000        lui     t0,0x0
   4:   25080000        addiu   t0,t0,0
   8:   0100f809        jalr    t0
   c:   00000000        nop

RELOCATION RECORDS FOR [.text]:
OFFSET   TYPE              VALUE
00000000 R_MIPS_HI16       label
00000004 R_MIPS_LO16       label

3) AFAIK (correct me), there is no MIPS-specific RELOC type for
the "branch"  instruction format in the BFD, so "bal" to the *external*
symbols is impossible.

May be, old gas generates something like RELOC_PCREL
for "bal external" ?


--
-=AV=-
