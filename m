From: Maxim Zaitsev <zaitsev@ukl.uni-freiburg.de>
Subject: Re: O2 arcboot 32-bit kernel boot fix
Date: Wed, 18 Aug 2004 17:52:35 +0200
References: <001401c483b8$51d289f0$54dc10c3@amos> <003901c48530$577b4f80$54dc10c3@amos> <200408181646.53698.maksik@gmx.co.uk>
In-Reply-To: <200408181646.53698.maksik@gmx.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <200408181752.35073.zaitsev@ukl.uni-freiburg.de>
Return-Path: <zaitsev@ukl.uni-freiburg.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Kaj-Michael Lang <milang@tal.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20040818155235.FfOC7xBObT_NbHqHRVuWha6z8IPQXGHZGaQ2FqNQGQo@z>

Ha!!! It works!!! Well, only 32-bit kernels work, but anyways, sorry for 
trouble. I must have tested it before bothering you with stupid questions... 

With regard to booting a 64-bit kernel it all looks OK, loading works and what 
I see in the end is:

Starting 64-bit kernel
--- Press <spacebar> to restart ---

No OOPs, no crash, nothing! Isn't that strange? Any ideas?

Regards,
Max

On Wednesday 18 August 2004 16:46, Max Zaitsev wrote:
> > Did you just use the small fix or did you use the whole patch ?
>
> No, I've just used the original 3.8.1 distribution and could not compile
> that I've tried it like a month ago and did not get anywhere neither with
> self-compilation nor with cross-compilation. I wrote Guido Guenther and he
> had said that he only tried to compile arcboot with gcc 2.95 and that gcc
> 3.x might have problems stripping some symbols that we want from the
> binary, while leaving the others, that we don't want... That would explain
> the factor 10 increase in the resulting file size and it's inability to do
> anything...
>
> So the thing is that the original arcboot 3.8.1 does not work for me if I
> compile (whereas the debian binary of the same version does), so it made no
> sense for me to try to apply your patch. I need to find a way to compile
> arcboot properly first. How do you do that yourself? Or do you think your
> fixes in makefiles make difference already? Actually, you've changed the
> LDFLAGS, which could be the problem... OK, I'll give it a try and let you
> know how it was.
>
> Regards,
> Max

-- 
Dr. Maxim Zaitsev
University Hospital Freiburg
Department of Diagnostic Radiology
Medical Physics
Hugstetterstr. 55
79106 Freiburg
Tel. (761) 270 3800
Fax. (761) 270 3831
