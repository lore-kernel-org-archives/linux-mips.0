Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B00341A79C;
	Sat, 26 Sep 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790419358; cv=none; b=crDrdI+FpZZ1xSOvs9QjRKdurzDMyPIBQixgz/ftENmPyWvLCzqxS/N6AGEB+JByXJjt39Tbq+DoOOSj3J4ilvzpPLl9c60QI/66wC2hLo5qHwS7OukskRKXBBhgXmiGHpSAGQlewEZXZe8oN/UxnjV2SKr+uDdm3rfVOz3/8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790419358; c=relaxed/simple;
	bh=+Lx1pgdbxYUQip+3017DTM7wVbGGBBQpwfnh75/eV/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOMJoxZvWap6e7OiRldmyqRMq8B/gCnUTb3vWU2dRxArrNNV6dIggitkxhKLPmpvDripUEdoLecpSPLwH7ln4QpCg97S0kJwEXB9zXXDqjlqHh+58UwjiUL9EUJaRxjgdS6hwqRKvhWlcBDzyO0jRrxKDRvaWeGZX4RNndf2iL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xAP4P-0007Lx-00; Sat, 26 Sep 2026 11:51:49 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 4F3A2C0D3A; Sat, 26 Sep 2026 11:41:25 +0200 (CEST)
Date: Sat, 26 Sep 2026 11:41:25 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] MIPS: generic: Remove undefined image 'ramdisk'
Message-ID: <areTRXqZCKybViOC@alpha.franken.de>
References: <20260922-mips-ramdisk-fix-v1-1-959d163c2445@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922-mips-ramdisk-fix-v1-1-959d163c2445@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 08:19:04AM -0700, Jeff Johnson wrote:
> As originally reported by Guenter Roeck [1] and subsequently confirmed by
> me [2], a MIPS allmodconfig build can fail with:
> 
> Error: configuration 'pcb110' references undefined image 'ramdisk' in property 'ramdisk'
> make[3]: *** [../arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
> make[2]: *** [../arch/mips/Makefile:403: vmlinux.gz.itb] Error 2
> 
> Or with:
> 
> Error: configuration 'pcb105' references undefined image 'ramdisk' in property 'ramdisk'
> make[3]: *** [../arch/mips/boot/Makefile:173: arch/mips/boot/vmlinux.gz.itb] Error 1
> make[2]: *** [../arch/mips/Makefile:403: vmlinux.gz.itb] Error 2
> 
> Guenter's original report made the observation that this was triggered by
> an operating system update since he saw the same errors appear on
> previously working kernels after the update.
> 
> I prompted an LLM with the information available and it provided the
> following additional information:
> 
> This is not a kernel bug — it's a mkimage behavior change in u-boot-tools.
> Your system recently received an upgrade from u-boot-tools 2024.01 =>
> 2025.10 (Ubuntu 24.04 noble-security), which included two upstream commits
> from June 2025:
> 
> - tools: mkimage: validate image references in FIT configurations (commit 7a8b25a)
> - tools: mkimage: propagate error codes from fit_handle_file() (commit 21705d3)
> 
> These commits made mkimage strictly validate that every image name
> referenced in a configurations node actually exists in the images section.
> Previously it silently ignored undefined references, now it errors out.
> 
> The offending files in the kernel are arch/mips/generic/board-jaguar2.its.S
> and arch/mips/generic/board-serval.its.S — their configurations reference
> ramdisk = "ramdisk" but no ramdisk image node is ever defined anywhere in the
> FIT source. This was always technically wrong; the new u-boot-tools 2025.10
> just enforces it.
> 
> To fix the issue, remove the stale ramdisk references from both ITS files.
> 
> Assisted-by: LLM
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/f817c158-412b-4fd1-9941-9c2ff421b91a@roeck-us.net/ # [1]
> Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/7eca1c7f-52d5-43bc-afcb-1f6ac198e391@oss.qualcomm.com/ # [2]
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
>  arch/mips/generic/board-jaguar2.its.S | 2 --
>  arch/mips/generic/board-serval.its.S  | 1 -
>  2 files changed, 3 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
