content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C525FA.C5C0374C"
Subject: Memory Management HAndling
Date: Fri, 11 Mar 2005 10:55:43 +0530
Message-ID: <4BF47D56A0DD2346A1B8D622C5C5902C61E22B@soc-mail.soc-soft.com>
From: <Rishabh@soc-soft.com>
Return-Path: <Rishabh@soc-soft.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050311052543.VwZqsWK9Y3wCzkYHF7Rp5njwQ3Epwsd85DXnAlojiU8@z>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C525FA.C5C0374C
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi,

I have been working on MMU of Linux Port of 2.4.20 kernel for MIPS Port.

I have found that MACROS like=0D

#define __pa(x)		((unsigned long) (x) - PAGE_OFFSET)
#define __va(x)		((void *)((unsigned long) (x) + PAGE_OFFSET))
#define virt_to_page(kaddr)	(mem_map + (__pa(kaddr) >> PAGE_SHIFT))


These macros can handle memory pages in KSEG0. Any suggestions on how
can they be changed for addressing memory present in HIGHMEM. Since VA
will not be in linear relation with mem_map.=0D
Rishabh Kumar Goel
Software Engineer
=0D
SoCrates Software India Pvt. Ltd.
a TOSHIBA Group Company
#10, Industrial Layout,
Prestige Atlanta,
III Block, Koramangala,
Bangalore - 560034
=0D
Ph. 080-51101669



The information contained in this e-mail message and in any annexure is
confidential to the  recipient and may contain privileged information. If=
 you are not
the intended recipient, please notify the sender and delete the message=
 along with
any annexure. You should not disclose, copy or otherwise use the=
 information contained
in the message or any annexure. Any views expressed in this e-mail are=
 those of the
individual sender except where the sender specifically states them to be=
 the views of
SoCrates Software India Pvt Ltd., Bangalore.
------_=_NextPart_001_01C525FA.C5C0374C
Content-Type: text/x-vcard;
	name="Rishabh Kumar Goel.vcf"
Content-Transfer-Encoding: base64
Content-Description: Rishabh Kumar Goel.vcf
Content-Disposition: attachment;
	filename="Rishabh Kumar Goel.vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpOOkdvZWw7UmlzaGFiaCBLdW1hcg0KRk46UmlzaGFi
aCBLdW1hciBHb2VsDQpPUkc6U29jcmF0ZXMgU29mdHdhcmUgSW5kaWEgUHZ0IEx0ZC47T1MgJiBE
RA0KVElUTEU6U0UNClRFTDtXT1JLO1ZPSUNFOjUxMTAxNjY5ICAgIEV4dDoyNjY5DQpBRFI7V09S
SztFTkNPRElORz1RVU9URUQtUFJJTlRBQkxFOjtTb2NyYXRlcyBTb2Z0d2FyZSBJbmRpYSBQdnQu
IEx0ZC47MTAgQnJpZGUgU3RyZWV0LCA9MEQ9MEFMYW5nZm9yZCBUb3duO0Jhbmc9DQphbG9yZTtL
YXJuYXRha2E7NTYwMDI1O0lORElBDQpMQUJFTDtXT1JLO0VOQ09ESU5HPVFVT1RFRC1QUklOVEFC
TEU6U29jcmF0ZXMgU29mdHdhcmUgSW5kaWEgUHZ0LiBMdGQuPTBEPTBBMTAgQnJpZGUgU3RyZWV0
LCA9MEQ9MEFMYW5nZm9yZCBUb3duPQ0KPTBEPTBBQmFuZ2Fsb3JlLCBLYXJuYXRha2EgNTYwMDI1
PTBEPTBBSU5ESUENCkVNQUlMO1BSRUY7SU5URVJORVQ6UmlzaGFiaEBzb2Mtc29mdC5jb20NClJF
VjoyMDA1MDIxN1QwNjA4NDJaDQpFTkQ6VkNBUkQNCg==

------_=_NextPart_001_01C525FA.C5C0374C--
