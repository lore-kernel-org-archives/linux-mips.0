Message-ID: <200505051756.j45Hu54Y021121@arbas.nms.ulrich-teichert.org>
Subject: Re: USB hangs on AU1100
Date: Thu, 5 May 2005 19:56:04 +0200 (MEST)
In-Reply-To: <20050505172017.GC1628@hattusa.textio> from "Thiemo Seufer" at May 05, 2005 07:20:17 PM
From: Ulrich Teichert <krypton@ulrich-teichert.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-Path: <krypton@ulrich-teichert.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Thiemo Seufer <ths@networkno.de>
Cc: "'linux-mips@linux-mips.org'" <linux-mips@linux-mips.org>
Message-ID: <20050505175604.PGOoAyFCDD7LURo1WGqlTCPos-oO66Gba80TU5Or1kU@z>

Hi,

[del]
>I wonder if the code works reliable. At least, a comma operator isn't a
>sequence point, which means the compiler is free to change the execution
>order.

Not accordingly to the C standard, which notes strict left-to-right
execution without reordering for the comma operator.

HTH,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de
Stormweg 24               |listening to: Suicide Drive (The Deep Eynde)
24539 Neumuenster, Germany|Public Pervert (Interpol) Cauchemar (Opération S)
