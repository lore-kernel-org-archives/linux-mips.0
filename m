Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720729;
	b=JNMsRv8OswdCmUVe2e7I1sUeSCPGkhjoggOCxTAd3qv7Hr5mjBt8dzE7yk1PjkJAzuGV
	 MniGRHLwWUbgvQ6H5P6SKEafBjSI0U1cYzNnmMk0miDteSCxsmUq9HesPRlvUdxJOc8XE
	 5QWO93wBDQF1gBgxl2MfMb34mTp9cdselfsb6fGBJJ3BXV7DNe6hQiIT4VDuqy3TMV5F6
	 CZSK+EDC78jxu2mwXpKyZjOl18hFEl4iyfRIiZ1v8YURt1CYniddLbjVAXwtzEmp++RSf
	 r31gqO4pwYz/ub68aefYzjYBamcgOs4u2b7HtPHuDhVSJ7EptBQ7KDm4qj0xVvMWbjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720729;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=+9npJWV5qWH7e96dOKzGh/TTw3CJZBrZgrRvuK3AaGA=;
	b=svitgjzpVICAEPAcnxIBl80Q4f0ZkZQyNz/wISYix4sFl8UucNh326HFpK3Rqk5GhXb7
	 IcGa2ei73lF329A2GW9Jc1kbUsceLlb1VUYywy/X5Cvrll5sRJatpPUHlCLUWgn9n2W5l
	 RsC1635Mrc8U3zl4CvR5K2k58nQkdYrA7T+EcmhC8AQiSms9rcDWE6mkN+sCXek4Wmf3h
	 0CZWn1JDxezxsW4gPttEfFTduWet8O9h31CCCv9YSzeS0OWuTGft0N/IV7ZIpXuiXhL9u
	 Oe8F2/5+94e0q/GanHOso732AlaAaXLtZ0y1WBDcv+/AuGXU0s1v/I4WeqA36L5y/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA49606A324;
	Tue,  3 Nov 2026 15:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBA49606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 4160092009E; Tue,  3 Nov 2026 16:45:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 3FC2492009C;
	Tue,  3 Nov 2026 15:45:20 +0000 (GMT)
Date: Tue, 3 Nov 2026 15:45:20 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Imre Kaloz <kaloz@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 1/2] MIPS: SGI-IP30: power off through the DS1687
 RTC
In-Reply-To: <20261102094106.21300-2-kaloz@kernel.org>
Message-ID: <alpine.DEB.2.21.2611030412480.15685@angie.orcam.me.uk>
References: <20261102094106.21300-1-kaloz@kernel.org> <20261102094106.21300-2-kaloz@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Nov 2026, Imre Kaloz wrote:

> +	/*
> +	 * The DS1687 RTC switches the power supply off.  Halt powers off
> +	 * too, as the power button needs a running kernel.
> +	 */

 Hmm, up to you to decide really, however the usual custom for halt has 
been to do nothing for systems that have no console monitor to return to. 
Shutdown scripts may arrange for no processes to remain running beyond 
init(8), making the system halted for any practical purpose though still 
technically running, but with:

# halt -f

command issued control just reaches back to the shell prompt.  That's what 
my observation has been about Linux since 1990s.

 Please consider this a point in discussion though rather than any kind of 
objection.  Perhaps your choice better matches the system in question.

 Conversely, if you do have a console monitor to return to, then it's what 
the halt action is supposed to do.  The firmware may then decide what to 
do next based on its own settings ("halt action") where available, e.g. 
present a command prompt or try to boot the system again.

  Maciej
