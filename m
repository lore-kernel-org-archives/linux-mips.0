Received: from mailapp01.imgtec.com ([195.59.15.196]:48626 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27012295AbbKYRnnHLsxC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Nov 2015 18:43:43 +0100
Date: Wed, 25 Nov 2015 17:43:39 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH 6/8] MIPS: ELF: Interpret the NAN2008 file header flag
In-Reply-To: <alpine.DEB.2.00.1511130006250.7097@tp.orcam.me.uk>
Message-ID: <alpine.DEB.2.00.1511251713340.16168@tp.orcam.me.uk>
References: <alpine.DEB.2.00.1511111418430.7097@tp.orcam.me.uk> <alpine.DEB.2.00.1511130006250.7097@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Fortune <Matthew.Fortune@imgtec.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
Message-ID: <20151125174339.GpzDUO2V5OwsKPlDGpVjhXWO3vKqwj7-icRgZ7W12ts@z>

On Fri, 13 Nov 2015, Maciej W. Rozycki wrote:

> This change relies on <https://patchwork.kernel.org/patch/7491081/> to 
> work correctly for dynamic binaries, otherwise an opposite-mode 
> interpreter will be incorrectly accepted, and worse yet enforce any 
> additional shared binaries to have their NaN mode opposite to that of the 
> main binary.  This will normally only happen for broken installations or 
> incorrectly built binaries where PT_INTERP points to the wrong dynamic 
> linker though.  Static binaries are unaffected.

 Ralf, I see that patch has now been applied, commit b582ef5c, and no 
concerns have been raised as to the changes considered here so you can 
give this series a go-ahead at your earliest convenience.  Unless someone 
chimes in at the last minute, that is.

 I'll be rather happy if you can push it through in time for 4.4 so that a 
corresponding change required for glibc to define the earliest Linux 
version to enable 2008-NaN support from can make it to the 2.23 release, 
scheduled for late Jan to early Feb 2016 according to the usual practice 
(see <http://www.gnu.org/software/libc/libc.html> for the release 
timeline).  A slushy freeze period is likely to start from Jan 1st for the 
glibc code base, but a change to set the minimum Linux version only for a 
feature already included is surely going to be acceptable even then.

  Maciej
