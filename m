Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ACA3A1A48
	for <linux-mips@vger.kernel.org>; Wed,  4 Mar 2026 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646517; cv=none; b=PqTSVAyI6mDgeYSxiTPOthKMZOXWJhEnhamG7AK0TPruNLr+4jmUBiKUjhgTD25q15zc7XIb6yagVQSz5PgL+J6/r/9Z1Gx3JDJGioW8lJbExaAjYkf3UibI4ApzFb6ieaDdnr7S6v5pcgsU6CHWvEJC7YKgCgH1dgoLAeUypiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646517; c=relaxed/simple;
	bh=qruMeCiyXniTYSw67dZnVQvj6lFtHivIfh3NglFZ+u8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I0r6fSV9q/XQYSonIz53Ho6ZuvA2P8esTcO4egS7rbT75mDGivsCV60k5vuMDRLWWoQSoxQ3dqvrzcLe7AIJTvyvmelu4lqtI+iLfDpkeEQqbuFBtrWNSrghqAA2mc+NirBMbDnexh3a27wUntaVzmo3FZOulJbaANzt07bSj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=u3laX670; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="u3laX670"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1772646503; bh=qruMeCiyXniTYSw67dZnVQvj6lFtHivIfh3NglFZ+u8=;
	h=Date:From:To:Subject:From;
	b=u3laX670Ea7wDjd2ufUGkfp7/DQHdMakVIiPHhXlG1oVHjzI5GQ18qd21k+JTsOm7
	 abW7CwQOw9d+pLc5dCR7ujOzJEqJkCgwXrTCKow7yB/wD3h72YyQIQ4d6H/5KNe+Hi
	 gHBPfEabk2+2YG3U5aSf43XB8E3SxEv7ZqfUZ5RQ=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69a87067-b734-7f0000032729-7f00000180d6-1
	for <multiple-recipients>; Wed, 04 Mar 2026 18:48:23 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed,  4 Mar 2026 18:48:23 +0100 (CET)
Date: Wed, 4 Mar 2026 18:48:23 +0100
From: Philipp Matthias Hahn <phahn-oss@avm.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-mips@vger.kernel.org
Subject: drivers/clocksource/mips-gic-timer.c:283 looks suspicious: ret != clk
Message-ID: <aahwZ3iJVbo55int@mail-auth.avm.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1772646503-C2589A3D-F6AC2B60/0/0
X-purgate-type: clean
X-purgate-size: 802
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

Hello,

while looking where IS_ERR(…) plus a manual NULL check can be converted
to IS_ERR_OR_NULL(…) I stumbled by accident over
gic_clocksource_of_init() line 283, where `IS_ERR(clk)` is used combined
with `!ret`:

static int __init gic_clocksource_of_init(struct device_node *node)
{
	struct clk *clk;
	int ret;
	…
	clk = of_clk_get(node, 0);
	if (!IS_ERR(clk)) {
		ret = clk_prepare_enable(clk);
		if (ret < 0) {
			pr_err("Failed to enable clock\n");
			clk_put(clk);
			return ret;
		}
		gic_frequency = clk_get_rate(clk);
	} else {
		…
	}
	ret = gic_clockevent_init();
	if (!ret && !IS_ERR(clk)) {
	     ^^^            ^^^

If this right or should with be changed to
	if (!ret && !IS_ERR(ret)) {
or even better
	if (!IS_ERR_OR_NULL(ret)) {

Philipp Hahn
