---
name: frontend-pattern
description: Framework-agnostic frontend development patterns, performance optimization, and UI best practices.
origin: ECC
---

# Frontend Development Patterns

Modern, performant frontend patterns focusing on standard Web APIs and framework-agnostic architecture. Suitable for Astro, Web Components, Svelte, or Vanilla TypeScript.

## When to Activate

- Designing component architecture (Composition, Slots, Templates)
- Managing state (Reactive stores, Custom Events, Signals)
- Implementing data fetching (Fetch API, Resource Management)
- Optimizing performance (Critical Path, Lazy Loading, Virtualization)
- Building accessible UI patterns (ARIA, Focus Management, Keyboard Nav)

## Component Patterns

### Composition via Slots
Avoid complex prop drilling by using "slots" (Content Projection). This follows the Web Component standard.

\`\`\`typescript
// Pattern: Slot-based structure (Logic-less Wrapper)
const template = \`
  <section class="card">
    <header class="card-header">
      <slot name="title">Default Title</slot>
    </header>
    <div class="card-content">
      <slot></slot> </div>
  </section>
\`;
\`\`\`

### Headless Logic (Controllers)
Encapsulate state and behavior in a class or function that is independent of the UI layer.

\`\`\`typescript
// Pattern: State Controller
export class DisclosureController {
  isOpen = false;
  private onUpdate: (state: boolean) => void;

  constructor(initial: boolean, onUpdate: (s: boolean) => void) {
    this.isOpen = initial;
    this.onUpdate = onUpdate;
  }

  toggle() {
    this.isOpen = !this.isOpen;
    this.onUpdate(this.isOpen);
    // Dispatch event for cross-framework compatibility
    window.dispatchEvent(new CustomEvent('ui:disclosure', { detail: this.isOpen }));
  }
}
\`\`\`

## State & Data Patterns

### Reactive Store (Pub/Sub)
Manage shared state using a simple subscription model instead of framework-specific Context.

\`\`\`typescript
export function createStore<T>(initialState: T) {
  let state = initialState;
  const subs = new Set<(s: T) => void>();

  return {
    get: () => state,
    update: (fn: (curr: T) => T) => {
      state = fn(state);
      subs.forEach(s => s(state));
    },
    subscribe: (fn: (s: T) => void) => {
      subs.add(fn);
      return () => subs.delete(fn);
    }
  };
}
\`\`\`

### Event-Driven Communication
Use Custom Events for decoupled communication between components.

\`\`\`typescript
// Dispatch
const notify = (msg: string) => {
  window.dispatchEvent(new CustomEvent('app:toast', {
    detail: { message: msg, type: 'success' },
    bubbles: true
  }));
};

// Listener
window.addEventListener('app:toast', (e: any) => {
  console.log(e.detail.message);
});
\`\`\`

## Performance Patterns

### Intersection Observer (Lazy Loading)
Detect visibility without scroll-event overhead.

\`\`\`typescript
export function lazyLoad(targets: NodeListOf<Element>) {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const el = entry.target as HTMLElement;
        if (el.dataset.src) (el as HTMLImageElement).src = el.dataset.src;
        observer.unobserve(el);
      }
    });
  });
  targets.forEach(t => observer.observe(t));
}
\`\`\`

### Debouncing Utility
Standard delay pattern for search inputs or resize listeners.

\`\`\`typescript
export function debounce<T extends (...args: any[]) => void>(fn: T, ms: number) {
  let timeout: ReturnType<typeof setTimeout>;
  return (...args: Parameters<T>) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => fn(...args), ms);
  };
}
\`\`\`

## Accessibility Patterns

### Focus Trap
Essential for Modals and Drawers.

\`\`\`typescript
export function createFocusTrap(root: HTMLElement) {
  const selectors = 'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])';
  
  root.addEventListener('keydown', (e) => {
    if (e.key !== 'Tab') return;
    const focusable = Array.from(root.querySelectorAll(selectors)) as HTMLElement[];
    const first = focusable[0];
    const last = focusable[focusable.length - 1];

    if (e.shiftKey && document.activeElement === first) {
      last.focus();
      e.preventDefault();
    } else if (!e.shiftKey && document.activeElement === last) {
      first.focus();
      e.preventDefault();
    }
  });
}
\`\`\`

## Error Handling Pattern

### Global Error Wrapper
Catch unhandled promise rejections or UI crashes.

\`\`\`typescript
window.addEventListener('error', (event) => {
  console.error('[UI ERROR]:', event.error);
});

window.addEventListener('unhandledrejection', (event) => {
  console.warn('[PROMISE REJECTION]:', event.reason);
});
\`\`\`
`;
