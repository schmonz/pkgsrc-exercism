# $NetBSD: Makefile,v 1.14 2024/01/10 19:14:32 bsiegert Exp $

DISTNAME=		exercism-cli-3.2.0
PKGREVISION=		7
CATEGORIES=		misc
MASTER_SITES=		${MASTER_SITE_GITHUB:=exercism/}
GITHUB_PROJECT=		cli
GITHUB_TAG=		v${PKGVERSION_NOREV}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://exercism.org/
COMMENT=		Command line tool for exercism.org
LICENSE=		mit

AUTO_MKDIRS=		yes

post-install:
	${INSTALL_DATA} ${WRKSRC}/shell/exercism_completion.bash		\
		${DESTDIR}${PREFIX}/share/bash-completion/completions/exercism
	${INSTALL_DATA} ${WRKSRC}/shell/exercism.fish				\
		${DESTDIR}${PREFIX}/share/fish/vendor_completions.d/exercism.fish
	${INSTALL_DATA} ${WRKSRC}/shell/exercism_completion.zsh			\
		${DESTDIR}${PREFIX}/share/zsh/site-functions/_exercism

.include "go-modules.mk"
.include "../../lang/go/go-module.mk"
.include "../../mk/bsd.pkg.mk"
