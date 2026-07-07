Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C112FC898;
	Tue,  7 Jul 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.136.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434456; cv=none; b=LzkG839eQCQpL97JMysgmdnu21G67PWnY21mEyPLwix0W61F9gW8q3Cv194lyS/uxjNiiRiQHteNgqlL3KBTN2wFvEe+hTo0LTAnteTlbPvF2gSYO/ibQr7hbVXr3+5KcYfq9CWi0MtYccQac5RK2l24RQLLcJ/WxA+I86L3PSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434456; c=relaxed/simple;
	bh=CRDo4ckbOw5FZPs3TJzOLxqiQm893/eLqElGEjgaDZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qn8PmPgyNaY4R+n/T+O9ukWsW0uPIlOUxTXL/Orjb12fwmYH7mRestD+ODvTjMW7oCkdPxkQtMzN8oRSLWS94f+rwnNjuIV4QO8CXq3W+AcHZyC3s4GQPHWJU4814axtXWqGz2qcIQj3rUznV8xhu6leB64yr9BPiNMQR1yi7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=LPg0nBLv; arc=none smtp.client-ip=130.136.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b="LPg0nBLv"
Received: from cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPSA id E7F621C013B;
	Tue,  7 Jul 2026 16:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1783434450;
	bh=CRDo4ckbOw5FZPs3TJzOLxqiQm893/eLqElGEjgaDZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPg0nBLv3AGKT+Dz564Mw36lejtqtYBAE+t+Di7FRcDq7U3DMy2f6b683vZHrzUZ1
	 mEtDcYVvDrfzbB3wAjsU9fMG6kRwGj8uClt+n2YzNyyrOqfQN6YaE8J/K+1vx3hnby
	 S0Jxyf1iDY/EpAB7qyp/30vPqVnJhPYDubHKtBZE=
Date: Tue, 7 Jul 2026 16:27:22 +0200
From: Renzo Davoli <renzo@cs.unibo.it>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ptrace: PTRACE_SET_SYSCALL_INFO syscall skipping
 support
Message-ID: <ak0MykKEi4b6AHRV@cs.unibo.it>
References: <20260704142643.692754-1-renzo@cs.unibo.it>
 <20260704142643.692754-2-renzo@cs.unibo.it>
 <akn8g3ya85YFqcjV@cs.unibo.it>
 <akpsTT20F6M2QWND@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akpsTT20F6M2QWND@redhat.com>

On Sun, Jul 05, 2026 at 04:38:05PM +0200, Oleg Nesterov wrote:
> OK, lets only allow the _SECCOMP -> _EXIT transition for now.
done in v3.
> But will it work on MIPS?

IMHO yes, it will (would).

PTRACE_EVENT_SECCOMP follows a different flow, it does not call ptrace_report_syscall_entry.

As a confirmation sashiko on v3 (allowing _SECCOMP -> _EXIT only) lists no more regressions.

happy hacking
	renzo
